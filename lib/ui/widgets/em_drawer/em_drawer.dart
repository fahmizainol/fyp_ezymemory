import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
          leading: Icon(Icons.home),
          title: Text(
            "Home",
            style: kcNormalTextBlack,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "Set reminder",
            style: kcNormalTextBlack,
          ),
          onTap: () {
            viewModel.onItemTapped(1);
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts),
          title: Text(
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
