import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'em_bottombar_model.dart';

class EMBottomBar extends StackedView<EMBottomBarModel> {
  const EMBottomBar({super.key});

  @override
  Widget builder(
    BuildContext context,
    EMBottomBarModel viewModel,
    Widget? child,
  ) {
    return BottomNavigationBar(
      backgroundColor: Colors.black38,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.refresh),
          label: 'Progress',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Leaderboard',
          backgroundColor: Colors.white,
        ),
      ],
      currentIndex: EMBottomBarModel.selectedIndex,
      // selectedItemColor: Colors.black,
      selectedItemColor: Colors.amber[800],
      onTap: (value) {
        print('test');
        viewModel.onItemTapped(value);
      },
    );
  }

  @override
  EMBottomBarModel viewModelBuilder(BuildContext context) => EMBottomBarModel();
}
