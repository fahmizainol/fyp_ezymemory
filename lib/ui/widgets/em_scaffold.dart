import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';

import 'em_drawer/em_drawer.dart';

class EMScaffold extends StatelessWidget {
  // final String title;
  final Color? backgroundColor;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingButton;
  bool shadowColor = false;
  EMScaffold(
      {super.key,
      // required this.title,
      this.backgroundColor,
      this.body,
      this.bottomNavigationBar,
      this.appBar,
      this.floatingButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingButton,
        appBar: appBar,
        drawer: const EMDrawer(),
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: backgroundColor ?? GFColors.DARK,
        body: body);
  }
}
