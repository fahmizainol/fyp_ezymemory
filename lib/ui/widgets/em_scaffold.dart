// TODO: create a uniform scaffold for all
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getwidget/colors/gf_color.dart';

class EMScaffold extends StatelessWidget {
  // final String title;
  final Color? backgroundColor;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  bool shadowColor = false;
  EMScaffold(
      {super.key,
      // required this.title,
      this.backgroundColor,
      this.body,
      this.bottomNavigationBar,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        drawer: Drawer(),
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: backgroundColor ?? GFColors.DARK,
        body: body);
  }
}
