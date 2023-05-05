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
  Future createUser(User user) async {
    try {
      _loggerService.printInfo(
          header, "createUser: creating user in firebase..");

      await _usersCollectionReference.doc(user.id).set(user.toJson());
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

      var userData = await _usersCollectionReference.doc(uid).get();

      _loggerService.printInfo(header,
          "getUser: getting user success! \n userData: ${userData.data()}");
      return userData.data();
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
      var userGet = await getUser(_authService.currentUser!.uid);
      final User user = User.fromJson(userGet);

      // var currentDeckList = user.deckList;
      // currentDeckList.add(deck.id);
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
}
