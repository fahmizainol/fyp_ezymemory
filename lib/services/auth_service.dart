import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';

import '../models/User.dart' as UserModel;

// mapping, serialization, deseraliazation done in here.
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  late User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  Future signUpWithEmail({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
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
      return authResult.user != null;
    } catch (e) {
      return e.toString();
    }
  }

  //   Future<bool> isUserLoggedIn() async {
  //   var user = await _firebaseAuth.currentUser();
  //   await _populateCurrentUser(user);
  //   return user != null;
  // }

  // // get user from firebase
  Future _populateCurrentUser(User? user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
