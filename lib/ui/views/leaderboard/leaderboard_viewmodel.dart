import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class LeaderboardViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<User>? fetchedUserList;

  @override
  Future futureToRun() => getUserList();

  Future getUserList() async {
    fetchedUserList = await _firestoreService.getUserList();
  }
}
