import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'em_drawer_model.dart';

class EMDrawer extends StackedView<EMDrawerModel> {
  const EMDrawer({super.key});

  @override
  Widget builder(
    BuildContext context,
    EMDrawerModel viewModel,
    Widget? child,
  ) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        const UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: GFColors.DARK),
          accountName: Text("Abhishek Mishra"),
          accountEmail: Text("abhishekm977@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text(
            "Home",
            style: kcNormalTextBlack,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text(
            "Set reminder",
            style: kcNormalTextBlack,
          ),
          onTap: () {
            viewModel.onItemTapped(1);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contacts),
          title: const Text(
            "Logout",
            style: kcNormalTextBlack,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }

  @override
  EMDrawerModel viewModelBuilder(BuildContext context) => EMDrawerModel();
}
