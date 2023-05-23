import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:uuid/uuid.dart';

import '../app/app.locator.dart';
import '../models/User/User.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _decksCollectionReference =
      FirebaseFirestore.instance.collection('decks');
  // final CollectionReference _flashcardsCollectionReference =
  //     FirebaseFirestore.instance.collection('decks').;

  final LoggerService _loggerService = locator<LoggerService>();
  final AuthService _authService = locator<AuthService>();

  // final User _currentUser = _authService.currentUser.uid()
  final header = "[firestore_service]";

  // USER
  Future createUser(String username, String email) async {
    try {
      _loggerService.printInfo(
          header, "createUser: creating user in firebase..");
      var uid = await _authService.getCurrentUserId();
      final User user = User(
        id: uid,
        username: username,
        email: email,
        currentPoints: 0,
        deckList: [],
        badgeList: [],
        checkInToday: false,
        userStatsId: '',
      );

      await _usersCollectionReference.doc(uid).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("createUser: ${e.message}");
        return e.message;
      }
      _loggerService.printShout("createUser: ${e.toString()}");
      return e.toString();
    }
  }

  Future getUser(String? uid) async {
    try {
      _loggerService.printInfo(header, "getUser: getting user from firebase..");

      final User user =
          await _usersCollectionReference.doc(uid).get().then((value) {
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        return User.fromJson(data);
      });

      // _loggerService.printInfo(header,
      //     "getUser: getting user success! \n userData: ${userData.data()}");
      return user;
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        _loggerService.printShout("getUser: ${e.message}");
        return e.message;
      }
      _loggerService.printShout("getUser: ${e.toString()}");
      return e.toString();
    }
  }

  // DECK
  Future<bool> createDeck(String deckName, String category) async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "createDeck: creating deck in firebase..");

      var uuid = const Uuid();
      final Deck deck = Deck(
        id: uuid.v4(),
        user_id: uid,
        name: deckName,
        createDate: DateTime.now(),
        isShared: false,
        category: category,
        flashcard: "",
      );
      // var userGet = await getUser(uid);
      final User user = await getUser(uid);

      var currentDeckList = [...user.deckList, deck.id];

      await _decksCollectionReference.doc(deck.id).set(deck.toJson());
      await _usersCollectionReference
          .doc(uid)
          .set(user.copyWith(deckList: currentDeckList).toJson());

      return true;
      // Need to create in User & Deck collection
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("getUser: ${e.message}");
        return false;
      }
      _loggerService.printShout("getUser: ${e.toString()}");
      return false;
    }
  }

  Future getDeckById(String deckId) async {
    try {
      _loggerService.printInfo(
          header, "getDeckById: getting deck with the id $deckId ...");

      final Deck deck =
          await _decksCollectionReference.doc(deckId).get().then((value) {
        Map<String, dynamic> deckMap = value.data() as Map<String, dynamic>;
        return Deck.fromJson(deckMap);
      });

      _loggerService.printInfo(header, "getDeckById: ${deck.toString()} ...");
      return deck;
    } catch (e) {}
  }

  Future getDeckList() async {
    try {
      _loggerService.printInfo(header, "getDeckList: getting deck list ...");

      var deckListSnap = await _decksCollectionReference.get();

      final List<Deck> decks = deckListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        Deck deckModel = Deck.fromJson(data);
        return deckModel;
      }).toList();

      return decks;
    } catch (e) {
      final List<Deck> emptyDeck = [];
      return emptyDeck;
    }
  }

  Future getUserDeckList() async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "getUserDeckList: getting user ${uid} deck list...");

      var userDeckListSnap = await _decksCollectionReference
          .where('user_id', isEqualTo: uid)
          .get();

      final List<Deck> userDecks = userDeckListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        Deck deckModel = Deck.fromJson(data);
        return deckModel;
      }).toList();

      _loggerService.printInfo(
          header, "getUserDeckList: ${userDecks.toString()}...");
      return userDecks;
      // var userDeckList = user.data["deckList"];
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("getUserDeckList: ${e.message}");
        return e.message;
        // throw e.message;
      }
      _loggerService.printShout("getUserDeckList: ${e.toString()}");
      return e.toString();
    }
  }

  Future updateDeck(String deckId, String deckName, String category) async {
    try {
      _loggerService.printInfo(header,
          "updateDeck: editing deckId $deckId deckName $deckName category $category");

      await _decksCollectionReference
          .doc(deckId)
          .update({"name": deckName, "category": category});

      return true;
    } catch (e) {}
  }

  Future deleteDeck(
    String deckId,
  ) async {
    try {
      _loggerService.printInfo(
          header, "updateDeck: deleting deckId $deckId ... ");

      await _decksCollectionReference.doc(deckId).delete();

      return true;
    } catch (e) {}
  }

  // FLASHCARD
  Future createFlashcard(String deckId, String front, String back) async {
    try {
      _loggerService.printInfo(
          header, "createDeck: creating deck in firebase..");

      var uuid = const Uuid();
      final Flashcard flashcard = Flashcard(
          id: uuid.v4(),
          back: back,
          front: front,
          easeFactor: 0.0,
          interval: 0,
          reviewTime: DateTime.now(),
          repetitions: 0,
          status: 'fresh',
          inUserStack: false);
      // var userGet = await getUser(uid);

      await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .doc(flashcard.id)
          .set(flashcard.toJson());
      //     .set(user.copyWith(deckList: currentDeckList).toJson());

      return true;
      // Need to create in User & Deck collection
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("getUser: ${e.message}");
        return false;
      }
      _loggerService.printShout("getUser: ${e.toString()}");
      return false;
    }
  }

  Future getFlashcardListById(String deckId, {int freshLimit = 10}) async {
    try {
      _loggerService.printInfo(
          header, "getFlashcardList: getting flashcard list $deckId ...");

      // TODO: if (count<limit)
      //          if (date has changed from lastFetchTime)

      // IDEA: add a field to flashcard session to indicate
      print(Timestamp.now().toDate());
      // FIXME: not working reviewTime
      var reviewFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .where('status', isEqualTo: 'review')
          // .where('reviewTime', isLessThan: Timestamp.now())
          .where('reviewTime', isLessThanOrEqualTo: Timestamp.now())
          // .where('repetitions', isNotEqualTo: 0)
          .get();

      var freshFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .where('status', isEqualTo: 'fresh')
          .limit(freshLimit)
          .get();

      // TODO: set the inUserStack = freshLimit in Deck to firebase

      final List<Flashcard> reviewFlashcards =
          reviewFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        // set inUserStack to true and update to firebase
        data["inUserStack"] = true;
        updateFlashcardById(deckId, data["id"], data["interval"],
            data["repetitions"], data["easeFactor"], data["reviewTime"],
            inUserStack: true, status: 'review');
        Flashcard flashcardModel = Flashcard.fromJson(data);
        return flashcardModel;
      }).toList();

      final List<Flashcard> freshFlashcards =
          freshFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        data["inUserStack"] = true;
        updateFlashcardById(deckId, data["id"], data["interval"],
            data["repetitions"], data["easeFactor"], data["reviewTime"],
            inUserStack: true, status: 'fresh');
        Flashcard flashcardModel = Flashcard.fromJson(data);
        return flashcardModel;
      }).toList();

      _loggerService.printInfo(header,
          "getFlashcardList: getting due review flashcard list success! ${reviewFlashcards.toString()}");

      _loggerService.printInfo(header,
          "getFlashcardList: getting fresh flashcard list success! ${freshFlashcards.toString()}");

      // combine the lists
      final List<Flashcard> flashcards = [
        ...reviewFlashcards,
        ...freshFlashcards
      ];

      _loggerService.printInfo(header,
          "getFlashcardList: getting session flashcard list success! ${flashcards.toString()}");

      return flashcards;
    } catch (e) {
      final List<Flashcard> emptyFlashcard = [];
      return emptyFlashcard;
    }
  }

  Future updateFlashcardById(
    String deckId,
    String flashcardId,
    int interval,
    int repetitions,
    double easeFactor,
    Timestamp reviewTime, {
    String status = 'review',
    bool inUserStack = false,
  }) async {
    try {
      _loggerService.printInfo(
          header, "updateFlashcardById: updating flashcardId $flashcardId ");

      // reset the time to 00:00:00

      // print("updateFlashcardById: $reviewTime");

      await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .doc(flashcardId)
          .update({
        "interval": interval,
        "repetitions": repetitions,
        "easeFactor": easeFactor,
        "reviewTime": reviewTime,
        "status": status,
        "inUserStack": inUserStack
      });

      return true;
    } catch (e) {}
  }

  Future checkFreshInUserStackCount(String deckId) async {
    try {
      _loggerService.printInfo(
          header, "checkFreshInUserStackCount: getting count for $deckId");

      int freshInUserStackCount = 0;
      var freshFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .where('status', isEqualTo: 'fresh')
          .where('inUserStack', isEqualTo: true)
          .count()
          // .limit(freshLimit)
          .get()
          .then((value) => freshInUserStackCount = value.count);

      _loggerService.printInfo(header,
          "checkFreshInUserStackCount:  count for $deckId is $freshInUserStackCount");

      return freshInUserStackCount;
    } catch (e) {}
  }
}
