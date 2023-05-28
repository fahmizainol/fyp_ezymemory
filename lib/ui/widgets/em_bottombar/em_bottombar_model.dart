import 'package:stacked/stacked.dart';

class EMBottomBarModel extends BaseViewModel {
  int selectedIndex = 1;

  void onItemTapped(int index) {
    selectedIndex = index;
    rebuildUi();
  }
}
