// TODO: create a uniform scaffold for all
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EMScaffold extends StatelessWidget {
  // final String title;
  final MaterialColor backgroundColor;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  bool shadowColor = false;
  EMScaffold(
      {super.key,
      // required this.title,
      required this.backgroundColor,
      this.body,
      this.bottomNavigationBar,
      this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        drawer: Drawer(),
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: backgroundColor,
        body: body);
  }
}
