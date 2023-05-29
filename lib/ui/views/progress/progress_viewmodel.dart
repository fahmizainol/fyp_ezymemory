import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ProgressViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();

  User? fetchedUser;

  @override
  Future futureToRun() => getUserProgress();

  Future getUserProgress() async {
    var uid = await _authService.getCurrentUserId();
    fetchedUser = await _firestoreService.getUser(uid);
  }
}
