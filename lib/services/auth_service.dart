import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';

// mapping, serialization, deseraliazation done in here.
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final FirestoreService _firestoreService = locator<FirestoreService>();
  final LoggerService _loggerService = locator<LoggerService>();
  final header = "[auth_service]";

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      _loggerService.printInfo(
          header, "loginWithEmail: logging in user $email");

      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await getCurrentUser(authResult.user);

      _loggerService.printInfo(header, "loginWithEmail: logging in success");

      return authResult.user != null;
    } catch (e) {
      _loggerService.printShout("loginWithEmail: failed");
      throw Exception(e.toString());
      // return e.toString();
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
      // await _firestoreService.createUser(userModel);
      // print(authResult.user);
      _loggerService.printInfo(header, "signUpWithEmail: sign up success");
      return authResult.user != null;
    } catch (e) {
      _loggerService.printShout("signUpWithEmail: failed");
      return e.toString();
    }
  }

  Future signOutUser() async {
    try {
      _loggerService.printInfo(header,
          "signOutUser: signing out user... ${_firebaseAuth.currentUser}");

      var authResult = await _firebaseAuth.signOut();

      return true;
    } catch (e) {
      _loggerService.printShout("signOutUser: failed");
      return e.toString();
    }
  }

  Future getCurrentUserId() async {
    try {
      var res = _firebaseAuth.currentUser?.uid;
      return res;
    } catch (e) {}
  }
}
