import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CounterViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final header = "[counter_viewmodel]";

  int _counter = 0;
  int get counter => _counter;

  User? fetchedUser;
  String? fuckthisshit;
  // User? get user => _user;

  @override
  Future<String> futureToRun() => getUser();

  @override
  Future<void> get future => getUser();

  Future<String> getUser() async {
    // setBusy(true);
    _loggerService.printInfo(
        header, "futureToRun: currentUser $_authService.currentUser!.uid");

    var response =
        await _firestoreService.getUser(_authService.currentUser!.uid);

    fetchedUser = User.fromJson(response);

    // setBusy(false);
    _loggerService.printInfo(header, "futureToRun: $fetchedUser");
    print("futureToRun: $fetchedUser");
    fuckthisshit = 'fuckstacked';
    return "Pukimak";
  }

  // Future getUser() async {
  //   // var res = await _firestoreService.getUser(_authService.firebaseUser.uid);
  //   // final user = res;
  //   // return user;
  //   // set busy
  //   setBusy(true);
  //   // set user to getuser
  //   // _user = await runBusyFuture(_firestoreService.getUser(_authService.firebaseUser.uid));
  //   _user = await _firestoreService.getUser(_authService.firebaseUser!.uid);
  //   print(_user);
  //   // set false
  //   setBusy(false);
  //   // return
  // }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }
}
