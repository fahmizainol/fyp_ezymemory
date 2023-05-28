import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EMBottomBarModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  static int selectedIndex = 1;
  static int prevIndex = 0;

  void onItemTapped(int index) {
    prevIndex = selectedIndex;
    changeIndex(index);
    switch (index) {
      case 0:
        _navigationService
            .navigateToProgressView()
            .then((value) => changeIndex(prevIndex));
        break;
      case 1:
        _navigationService
            .navigateToHomeView()
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

  void changeIndex(int index) {
    selectedIndex = index;
    rebuildUi();
    // print(selectedIndex);
  }
}
