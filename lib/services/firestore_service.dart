import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fyp_ezymemory/models/Badge/Badge.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/models/UserStats/UserStats.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../app/app.locator.dart';
import '../models/User/User.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _decksCollectionReference =
      FirebaseFirestore.instance.collection('decks');
  final CollectionReference _badgesCollectionReference =
      FirebaseFirestore.instance.collection('badges');
  final CollectionReference _userStatsCollectionReference =
      FirebaseFirestore.instance.collection('userStats');
  // final CollectionReference _flashcardsCollectionReference =
  //     FirebaseFirestore.instance.collection('decks').;

  final LoggerService _loggerService = locator<LoggerService>();
  final AuthService _authService = locator<AuthService>();

  // final User _currentUser = _authService.currentUser.uid()
  final header = "[firestore_service]";

  /// ===========================================================================
  ///                            USER
  /// ===========================================================================

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
      if (e is PlatformException) {
        _loggerService.printShout("getUser: ${e.message}");
        return e.message;
      }
      _loggerService.printShout("getUser: ${e.toString()}");
      return e.toString();
    }
  }

  Future getUserList() async {
    try {
      _loggerService.printInfo(
          header, "getUserList: getting user list from firebase..");

      var userListSnap = await _usersCollectionReference
          .orderBy('currentPoints', descending: true)
          .get();

      final List<User> userList = userListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        print(data);
        User userModel = User.fromJson(data);
        return userModel;
      }).toList();
      // _loggerService.printInfo(header,
      //     "getUserList: getting user success! \n userData: ${userData.data()}");
      return userList;
    } catch (e) {
      final List<User> emptyUser = [];
      return emptyUser;
    }
  }

  Future updatePoints(double points) async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "updatePoints: adding $points to user $uid ..");

      final User user = await getUser(uid);

      double totalPoints = points + user.currentPoints;

      await _usersCollectionReference
          .doc(uid)
          .update({"currentPoints": totalPoints});

      _loggerService.printInfo(
          header, "updatePoints: added $points to user $uid..");
    } catch (e) {}
  }

  /// ===========================================================================
  ///                            DECK
  /// ===========================================================================

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
        lastFetchedTime: DateTime.now(),
      );
      // var userGet = await getUser(uid);
      await _decksCollectionReference.doc(deck.id).set(deck.toJson());

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

  Future getSharedDeckList() async {
    try {
      _loggerService.printInfo(
          header, "getSharedDeckList: getting shared deck list ...");

      var uid = await _authService.getCurrentUserId();

      var deckListSnap = await _decksCollectionReference
          .where('isShared', isEqualTo: true)
          .where('user_id', isNotEqualTo: uid)
          .get();

      final List<Deck> decks = deckListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        Deck deckModel = Deck.fromJson(data);
        return deckModel;
      }).toList();

      _loggerService.printInfo(
          header, "getSharedDeckList: ${decks.toString()} ...");

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
          header, "getUserDeckList: getting user $uid deck list...");

      var userDeckListSnap = await _decksCollectionReference
          .where('user_id', isEqualTo: uid)
          .orderBy('createDate', descending: true)
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

  // Future getUserDeckCount()

  Future importUserDeck(Deck importedDeck) async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "importUserDeck: importing deck to user...");

      var importedDeckFlashcard = await _decksCollectionReference
          .doc(importedDeck.id)
          .collection('flashcards')
          .get();

      _loggerService.printInfo(
          header, "importUserDeck: creating local list of flashcards and  ...");

      var uuid = const Uuid();
      final Deck deck =
          importedDeck.copyWith(id: uuid.v4(), user_id: uid, isShared: false);

      final List<Flashcard> importedDeckFlashcardList =
          importedDeckFlashcard.docs.map((e) {
        Map<String, dynamic> data = e.data();
        // print(data["id"]);
        // updateFlashcardById(
        //     inUserStack: true,
        //     status: 'fresh',
        //     deckId: deck.id,
        //     flashcardId: data["id"],
        //     reviewTime: data["reviewTime"],
        //     easeFactor: data["easeFactor"],
        //     interval: data["interval"],
        //     repetitions: data["repetitions"]);
        data['status'] = 'fresh';
        data['inUserStack'] = false;
        data['reviewTime'] = Timestamp.now();
        // print(data[])
        data['interval'] = 0;
        data['repetitions'] = 0;
        data['easeFactor'] = 0;
        data['id'] = uuid.v4();

        Flashcard flashcardModel = Flashcard.fromJson(data);
        createFlashcardByModel(deck.id, flashcardModel);
        // Flashcard newFlashcardModel = flashcardModel.copyWith
        return flashcardModel;
      }).toList();

      // set deck
      _loggerService.printInfo(
          header, "importUserDeck: saving the deck to firebase  ...");

      await _decksCollectionReference.doc(deck.id).set(deck.toJson());

      // set flashcard
      _loggerService.printInfo(
          header, "importUserDeck: saving the flashcards to firebase  ...");

      for (Flashcard flashcard in importedDeckFlashcardList) {
        await _decksCollectionReference
            .doc(deck.id)
            .collection('flashcards')
            .doc(flashcard.id)
            .set(flashcard.toJson());
      }

      return true;
      // Need to create in User & Deck collection
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("importUserDeck: ${e.message}");
        return false;
      }
      _loggerService.printShout("importUserDeck: ${e.toString()}");
      return false;
    }
  }

  Future updateDeck(
      String deckId, String deckName, String category, bool isShared) async {
    try {
      _loggerService.printInfo(header,
          "updateDeck: editing deckId $deckId deckName $deckName category $category");

      await _decksCollectionReference.doc(deckId).update(
          {"name": deckName, "category": category, "isShared": isShared});

      return true;
    } catch (e) {}
  }

  Future updateDeckLastFetchedTime(
    String deckId,
  ) async {
    try {
      _loggerService.printInfo(header, "updateDeck: editing deckId $deckId ");

      await _decksCollectionReference
          .doc(deckId)
          .update({"lastFetchedTime": Timestamp.now()});

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

  Future calculateTimeDifference(String deckId) async {
    // calculate time
  }

  /// ===========================================================================
  ///                            FLASHCARD
  /// ===========================================================================

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
          reviewTime: DateTime.now().subtract(const Duration(days: 1)),
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

  Future createFlashcardByModel(String deckId, Flashcard flashcard) async {
    try {
      _loggerService.printInfo(header,
          "createFlashcardByModel: creating deck in firebase.. ${flashcard.reviewTime}");

      var uuid = const Uuid();
      // final Flashcard flashcard = Flashcard(
      //     id: uuid.v4(),
      //     back: back,
      //     front: front,
      //     easeFactor: 0.0,
      //     interval: 0,
      //     reviewTime: DateTime.now(),
      //     repetitions: 0,
      //     status: 'fresh',
      //     inUserStack: false);

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
        _loggerService.printShout("createFlashcardByModel: ${e.message}");
        return false;
      }
      _loggerService.printShout("createFlashcardByModel: ${e.toString()}");
      return false;
    }
  }

  Future getFlashcardListById(String deckId, {int freshLimit = 10}) async {
    try {
      _loggerService.printInfo(
          header, "getFlashcardList: getting flashcard list $deckId ...");

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
          // .orderBy('reviewTime', descending: false)
          .where('status', isEqualTo: 'fresh')
          .where('inUserStack', isEqualTo: true)
          .get();

      final List<Flashcard> reviewFlashcards =
          reviewFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        // set inUserStack to true and update to firebase
        data["inUserStack"] = true;
        updateFlashcardById(
            inUserStack: true,
            status: 'review',
            deckId: deckId,
            flashcardId: data["id"],
            reviewTime: data["reviewTime"],
            easeFactor: data["easeFactor"],
            interval: data["interval"],
            repetitions: data["repetitions"]);
        Flashcard flashcardModel = Flashcard.fromJson(data);
        return flashcardModel;
      }).toList();

      final List<Flashcard> freshInUserStackFlashcard =
          freshFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        Flashcard flashcardModel = Flashcard.fromJson(data);
        return flashcardModel;
      }).toList();

      _loggerService.printInfo(header,
          "getFlashcardList: getting due review flashcard list success! ${reviewFlashcards.toString()}");

      _loggerService.printInfo(header,
          "getFlashcardList: getting fresh flashcard list success! ${freshInUserStackFlashcard.toString()}");

      // combine the lists
      final List<Flashcard> flashcards = [
        ...reviewFlashcards,
        ...freshInUserStackFlashcard
      ];

      _loggerService.printInfo(header,
          "getFlashcardList: getting session flashcard list success! ${flashcards.toString()}");

      return flashcards;
    } catch (e) {
      final List<Flashcard> emptyFlashcard = [];
      return emptyFlashcard;
    }
  }

  Future getFreshFlashcardListById(String deckId, {int freshLimit = 10}) async {
    try {
      _loggerService.printInfo(header,
          "getFreshFlashcardListById: getting flashcard list $deckId ...");

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
          // .orderBy('reviewTime', descending: false)
          .where('status', isEqualTo: 'fresh')
          .limit(freshLimit)
          .get();

      await updateDeckLastFetchedTime(deckId);

      final List<Flashcard> reviewFlashcards =
          reviewFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        // set inUserStack to true and update to firebase
        data["inUserStack"] = true;
        updateFlashcardById(
            inUserStack: true,
            status: 'review',
            deckId: deckId,
            flashcardId: data["id"],
            reviewTime: data["reviewTime"],
            easeFactor: data["easeFactor"],
            interval: data["interval"],
            repetitions: data["repetitions"]);
        Flashcard flashcardModel = Flashcard.fromJson(data);
        return flashcardModel;
      }).toList();

      final List<Flashcard> freshInUserStackFlashcard =
          freshFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        data["inUserStack"] = true;
        updateFlashcardById(
            inUserStack: true,
            status: 'fresh',
            deckId: deckId,
            flashcardId: data["id"],
            reviewTime: data["reviewTime"],
            easeFactor: data["easeFactor"],
            interval: data["interval"],
            repetitions: data["repetitions"]);
        Flashcard flashcardModel = Flashcard.fromJson(data);

        return flashcardModel;
      }).toList();

      _loggerService.printInfo(header,
          "getFreshFlashcardListById: getting due review flashcard list success! ${reviewFlashcards.toString()}");

      _loggerService.printInfo(header,
          "getFreshFlashcardListById: getting fresh flashcard list success! ${freshInUserStackFlashcard.toString()}");

      // combine the lists
      final List<Flashcard> flashcards = [
        ...reviewFlashcards,
        ...freshInUserStackFlashcard
      ];

      _loggerService.printInfo(header,
          "getFreshFlashcardListById: getting session flashcard list success! ${flashcards.toString()}");

      return flashcards;
    } catch (e) {
      final List<Flashcard> emptyFlashcard = [];
      return emptyFlashcard;
    }
  }

  Future getQuizFlashcards(String deckId, {int freshLimit = 10}) async {
    try {
      _loggerService.printInfo(
          header, "getQuizFlashcards: getting flashcard list $deckId ...");

      var freshFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          // .orderBy('reviewTime', descending: false)
          .limit(freshLimit)
          .get();

      await updateDeckLastFetchedTime(deckId);

      final List<Flashcard> freshInUserStackFlashcard =
          freshFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        data["inUserStack"] = true;
        updateFlashcardById(
            inUserStack: true,
            status: 'fresh',
            deckId: deckId,
            flashcardId: data["id"],
            reviewTime: data["reviewTime"],
            easeFactor: data["easeFactor"],
            interval: data["interval"],
            repetitions: data["repetitions"]);
        Flashcard flashcardModel = Flashcard.fromJson(data);

        return flashcardModel;
      }).toList();

      _loggerService.printInfo(header,
          "getQuizFlashcards: getting fresh flashcard list success! ${freshInUserStackFlashcard.toString()}");

      // combine the lists
      final List<Flashcard> flashcards = [...freshInUserStackFlashcard];

      _loggerService.printInfo(header,
          "getQuizFlashcards: getting session flashcard list success! ${flashcards.toString()}");

      return flashcards;
    } catch (e) {
      final List<Flashcard> emptyFlashcard = [];
      return emptyFlashcard;
    }
  }

  Future getMatchFlashcards(String deckId, {int freshLimit = 6}) async {
    try {
      _loggerService.printInfo(
          header, "getMatchFlashcards: getting flashcard list $deckId ...");

      var freshFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          // .orderBy('reviewTime', descending: false)
          .limit(freshLimit)
          .get();

      await updateDeckLastFetchedTime(deckId);

      final List<Flashcard> freshInUserStackFlashcard =
          freshFlashcardListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data();
        data["inUserStack"] = true;
        updateFlashcardById(
            inUserStack: true,
            status: 'fresh',
            deckId: deckId,
            flashcardId: data["id"],
            reviewTime: data["reviewTime"],
            easeFactor: data["easeFactor"],
            interval: data["interval"],
            repetitions: data["repetitions"]);
        Flashcard flashcardModel = Flashcard.fromJson(data);

        return flashcardModel;
      }).toList();

      _loggerService.printInfo(header,
          "getQuizFlashcards: getting fresh flashcard list success! ${freshInUserStackFlashcard.toString()}");

      // combine the lists
      final List<Flashcard> flashcards = [...freshInUserStackFlashcard];

      _loggerService.printInfo(header,
          "getQuizFlashcards: getting session flashcard list success! ${flashcards.toString()}");

      return flashcards;
    } catch (e) {
      final List<Flashcard> emptyFlashcard = [];
      return emptyFlashcard;
    }
  }

  Future getFlashcardsCountByDeckId(String deckId) async {
    try {
      var flashcardSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .count()
          .get();

      int flashcardsCount = flashcardSnap.count;

      return flashcardsCount;
    } catch (e) {}
  }

  Future checkFreshFetch(String deckId) async {
    try {
      // if inUserStack = 20 dont refetch
      // if inUserStack < 20 refetch && DateTime.now() - lastFetchedTime > 1 day refetch. eg: inUserStack = 15 and already > 1 day, refetch 5 more cards to make it 20
      // if inUserStack < 20 refetch && DateTime.now() - lastFetchedTime < 1 day dont refetch. eg: inUserStack = 15 but < 1day, fetch only the 15

      _loggerService.printInfo(
          header, "checkFreshFetch: getting flashcard limit for $deckId");

      var freshFlashcardListSnap = await _decksCollectionReference
          .doc(deckId)
          .collection('flashcards')
          .where('status', isEqualTo: 'fresh')
          .where('inUserStack', isEqualTo: true)
          .count()
          .get();

      _loggerService.printInfo(header,
          "checkFreshFetch: gfreshFlashcardListSnap.count ${freshFlashcardListSnap.count}");

      // if (freshFlashcardListSnap.count == 0) {
      //   return 10; // FIXME hardcoded change it later
      // }
      int limit = freshFlashcardListSnap.count;
      int limitNewCard = 0;
      if (limit == 0) {
        var freshCardNew = await _decksCollectionReference
            .doc(deckId)
            .collection('flashcards')
            .where('status', isEqualTo: 'fresh')
            .count()
            .get();

        limitNewCard = freshCardNew.count;
      }

      Deck currentDeck = await getDeckById(deckId);

      Duration duration =
          DateTime.now().difference(currentDeck.lastFetchedTime);

      // print(duration.inDays);
      // print(limit);
      // if (duration.inDays >= 1) {
      //   limit = 20;
      // }

      // print(limit);
      _loggerService.printInfo(header,
          "checkFreshFetch: limit is $limit and duration is ${duration.inDays}");
      if (limit == 0 && limitNewCard != 0) return true;
      if (duration.inDays >= 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {}
  }

  Future updateFlashcardById({
    required String deckId,
    required String flashcardId,
    int interval = 0,
    int repetitions = 0,
    double easeFactor = 0.0,
    required Timestamp reviewTime,
    String status = 'review',
    bool inUserStack = false,
  }) async {
    try {
      _loggerService.printInfo(header,
          "updateFlashcardById: updating flashcardId $flashcardId interval $interval repetitions $repetitions inUserStack $inUserStack");

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

  /// ===========================================================================
  ///                            BADGHE
  /// ===========================================================================

  Future uploadImg(badgeImg) async {
    _loggerService.printInfo(header, "uploadImg: creating badge in firebase..");

    final firebaseStorage = FirebaseStorage.instance;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    // final _imagePicker = ImagePicker();
    // PickedFile image;
    //Check Permissions
    await Permission.storage.request();

    // var permissionStatus = await Permission.photos.status;
    var permissionStatus = await Permission.storage.status;
    try {
      if (permissionStatus.isGranted) {
//Get a reference to storage root
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('badges');

        //Create a reference for the image to be stored
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        //Handle errors/success

        //Store the file
        await referenceImageToUpload.putFile(File(badgeImg));
        //Success: get the download URL
        var imageUrl = await referenceImageToUpload.getDownloadURL();
        print(imageUrl);
        return imageUrl;
      } else {
        print('Permission not granted. Try Again with permission access');
      }
    } catch (e) {}
  }

  Future<bool> createBadge(
      String image, String name, String description) async {
    try {
      _loggerService.printInfo(
          header, "createBadge: creating badge in firebase..");

      var uuid = const Uuid();

      final Badge badge = Badge(
        id: uuid.v4(),
        image: image,
        name: name,
        description: description,
      );
      // var userGet = await getUser(uid);
      await _badgesCollectionReference.doc(badge.id).set(badge.toJson());

      return true;
      // Need to create in User & Deck collection
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("createBadge: ${e.message}");
        return false;
      }
      _loggerService.printShout("createBadge: ${e.toString()}");
      return false;
    }
  }

  Future getBadgeList() async {
    try {
      _loggerService.printInfo(header, "getBadgeList: getting badge list ...");

      var badgeListSnap = await _badgesCollectionReference.get();

      final List<Badge> badges = badgeListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        Badge badgeModel = Badge.fromJson(data);
        return badgeModel;
      }).toList();

      // _loggerService.printInfo(
      //     header, "getBadgeList: ${badges.toString()} ...");

      return badges;
    } catch (e) {
      final List<Badge> emptyDeck = [];
      return emptyDeck;
    }
  }

  Future getBadgeById(String badgeId) async {
    try {
      _loggerService.printInfo(
          header, "getBadgeById: getting badge with the id $badgeId ...");

      final Badge badge =
          await _badgesCollectionReference.doc(badgeId).get().then((value) {
        Map<String, dynamic> badgeMap = value.data() as Map<String, dynamic>;
        return Badge.fromJson(badgeMap);
      });

      _loggerService.printInfo(header, "getBadgeById: ${badge.toString()} ...");
      return badge;
    } catch (e) {}
  }

  Future updateBadge(
      String badgeId, String name, String image, String description) async {
    try {
      _loggerService.printInfo(header,
          "updateBadge: editing badgeId $badgeId image $image description $description");

      await _badgesCollectionReference
          .doc(badgeId)
          .update({"name": name, "image": image, "description": description});

      return true;
    } catch (e) {}
  }

  Future deleteBadge(
    String badgeId,
  ) async {
    try {
      _loggerService.printInfo(
          header, "deleteBadge: deleting badgeId $badgeId ... ");

      await _badgesCollectionReference.doc(badgeId).delete();

      return true;
    } catch (e) {}
  }

  /// ===========================================================================
  ///                            USERSTATS
  /// ===========================================================================

  Future addBadgeToUser(String badgeId) async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "addBadgeToUser: importing badge to user...");

      Badge badge = await getBadgeById(badgeId);

      var uuid = const Uuid();
      final UserStats userStatsBadge = UserStats(
          description: badge.description,
          image: badge.image,
          id: uuid.v4(),
          name: badge.name,
          uid: uid);

      // set deck
      _loggerService.printInfo(
          header, "addBadgeToUser: saving the badge to userStats  ...");

      await _userStatsCollectionReference
          .doc(userStatsBadge.id)
          .set(userStatsBadge.toJson());

      return true;
      // Need to create in User & Deck collection
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("addBadgeToUser: ${e.message}");
        return false;
      }
      _loggerService.printShout("addBadgeToUser: ${e.toString()}");
      return false;
    }
  }

  Future getUserStatsList() async {
    try {
      var uid = await _authService.getCurrentUserId();
      _loggerService.printInfo(
          header, "getUserStatsList: getting user $uid userStats list...");

      var userStatsListSnap = await _userStatsCollectionReference
          .where('uid', isEqualTo: uid)
          .get();

      final List<UserStats> userStats = userStatsListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        UserStats userStatsModel = UserStats.fromJson(data);
        return userStatsModel;
      }).toList();

      _loggerService.printInfo(
          header, "getUserStatsList: ${userStats.toString()}...");
      return userStats;
      // var userDeckList = user.data["deckList"];
    } catch (e) {
      if (e is PlatformException) {
        _loggerService.printShout("getUserStatsList: ${e.message}");
        return e.message;
        // throw e.message;
      }
      _loggerService.printShout("getUserStatsList: ${e.toString()}");
      return e.toString();
    }
  }
}
