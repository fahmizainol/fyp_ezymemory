import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
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
  final LoggerService _loggerService = locator<LoggerService>();
  final AuthService _authService = locator<AuthService>();

  // final User _currentUser = _authService.currentUser.uid()
  final header = "[firestore_service]";

  // USER
  Future createUser(String username, String email) async {
    try {
      _loggerService.printInfo(
          header, "createUser: creating user in firebase..");

      final User user = User(
        id: _authService.currentUser!.uid,
        username: username,
        email: email,
        currentPoints: 0,
        deckList: [],
        badgeList: [],
        checkInToday: false,
        userStatsId: '',
      );

      await _usersCollectionReference
          .doc(_authService.currentUser!.uid)
          .set(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
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
      _loggerService.printInfo(
          header, "createDeck: creating deck in firebase..");

      var uuid = const Uuid();
      final Deck deck = Deck(
          id: uuid.v4(),
          user_id: _authService.currentUser!.uid,
          name: deckName,
          createDate: DateTime.now(),
          isShared: false,
          category: category,
          flashcard: "");
      // var userGet = await getUser(_authService.currentUser!.uid);
      final User user = await getUser(_authService.currentUser!.uid);

      var currentDeckList = [...user.deckList, deck.id];

      await _decksCollectionReference.doc(deck.id).set(deck.toJson());
      await _usersCollectionReference
          .doc(_authService.currentUser!.uid)
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
        var deckMap = value.data() as Map<String, dynamic>;
        return Deck.fromJson(deckMap);
      });

      // var deckSnap = await _decksCollectionReference
      //     .doc(deckId)
      //     .get()
      //     .then((value) => value.data() as Map<String, dynamic>);

      // final Deck deck = Deck.fromJson(deckSnap);

      _loggerService.printInfo(header, "getDeckById: ${deck.toString()} ...");
      return deck;
    } catch (e) {}
  }

  Future getDeckList() async {
    try {
      _loggerService.printInfo(header, "getDeckList: getting deck list ...");

      // var deckListSnap = await _decksCollectionReference.get();
      // final deckList = deckListSnap.docs.map((e) => e.data().toList());

      // final List<Deck> decks =
      //     await _decksCollectionReference.get().then((value) {
      //   var deckListMap = value.docs.map((e) {
      //     var data = e.data() as Map<String, dynamic>;
      //     return Deck.fromJson(data);
      //   }).toList();
      //   return deckListMap;
      // });

      var deckListSnap = await _decksCollectionReference.get();
      // print(deckListSnap);
      final List<Deck> decks = deckListSnap.docs.map((e) {
        Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        Deck deckModel = Deck.fromJson(data);
        return deckModel;
      }).toList();

      // final List<Deck> decks = deckListSnap.docs.map((e) {
      //   Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      //   return Deck.fromJson(data);
      // }).toList();
      // print(decks);
      // print(decks[0]);

      // var deckListSnap = await _decksCollectionReference.get().then((value) {
      //   final list = value.docs.map((e) => e.data());
      //   return list;
      // });

      // final List<Deck> deckList = deckListSnap.toList();

      // _loggerService.printInfo(header, "getDeckList: ${decks.toString()} ...");

      return decks;
    } catch (e) {}
  }

  Future getUserDeckList() async {
    try {
      _loggerService.printInfo(header,
          "getUserDeckList: getting user ${_authService.currentUser!.email} deck list...");

      var userGet = await getUser(_authService.currentUser!.uid);
      final User user = User.fromJson(userGet);

      var userDeckListId = [...user.deckList]; // Only the list of deck id.

      // return userDeckList;
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
}
