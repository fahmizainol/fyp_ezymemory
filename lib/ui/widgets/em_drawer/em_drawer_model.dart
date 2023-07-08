import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EMDrawerModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();
  final PointService _pointService = locator<PointService>();

  static int selectedIndex = 1;
  static int prevIndex = 0;

  void onItemTapped(int index) {
    prevIndex = selectedIndex;
    changeIndex(index);
    switch (index) {
      case 0:
        _navigationService
            .navigateToHomeView()
            .then((value) => changeIndex(prevIndex));
        break;
      case 1:
        _navigationService
            .navigateToUserSettingsView()
            .then((value) => changeIndex(prevIndex));
        break;
      case 2:
        _navigationService
            .navigateToLeaderboardView()
            .then((value) => changeIndex(prevIndex));
        break;
      default:
    }
    rebuildUi();
  }

  Future signOut() async {
    await _authService.signOutUser();

    await _navigationService.navigateToLoginView();
    dispose();
  }

  void changeIndex(int index) {
    selectedIndex = index;
    rebuildUi();
    // print(selectedIndex);
  }
}
