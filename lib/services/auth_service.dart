import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';

import '../models/User/User.dart' as UserModel;

// mapping, serialization, deseraliazation done in here.
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final LoggerService _loggerService = locator<LoggerService>();
  final header = "[auth_service]";

  final User? _currentUser = FirebaseAuth.instance.currentUser;
  User? get currentUser => _currentUser;

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      _loggerService.printInfo(header, "loginWithEmail: logging in user...");

      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await getCurrentUser(authResult.user);

      _loggerService.printInfo(header, "loginWithEmail: logging in success");

      return authResult.user != null;
    } catch (e) {
      _loggerService.printShout("loginWithEmail: failed");
      return e.toString();
    }
  }

  Future signUpWithEmail({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      _loggerService.printInfo(header, "signUpWithEmail: signing up user...");

      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userModel = UserModel.User(
        id: authResult.user!.uid,
        username: username,
        email: email,
        currentPoints: 0,
        deckList: [],
        badgeList: [],
        checkInToday: false,
        userStatsId: '',
      );

      await _firestoreService.createUser(userModel);
      // print(authResult.user);
      _loggerService.printInfo(header, "signUpWithEmail: sign up success");
      return authResult.user != null;
    } catch (e) {
      _loggerService.printShout("signUpWithEmail: failed");
      return e.toString();
    }
  }

  //   Future<bool> isUserLoggedIn() async {
  //   var user = await _firebaseAuth.currentUser();
  //   await _populateCurrentUser(user);
  //   return user != null;
  // }
  // Future getCurrentUserId()

  // get user from firebase
  Future getCurrentUser(User? user) async {
    if (user != null) {
      _loggerService.printInfo(
          header, "getCurrentUser: getting current user.. $user");

      var userModel = await _firestoreService.getUser(user.uid);
      final UserModel.User currentUser = UserModel.User.fromJson(userModel);

      _loggerService.printInfo(
          header, "getCurrentUser: \n currentUser: $currentUser");
      return currentUser;
    }
    _loggerService.printShout("getCurrentUser: failed");
    throw Exception('Cannot get user from database');
  }
}
