import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:getwidget/getwidget.dart';

class EMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const EMAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: kcAppBarText,
      ),
      elevation: 0.0,
      backgroundColor: GFColors.DARK,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
