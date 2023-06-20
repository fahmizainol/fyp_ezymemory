import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'admin_badges_viewmodel.dart';

class AdminBadgesView extends StackedView<AdminBadgesViewModel> {
  const AdminBadgesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AdminBadgesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  AdminBadgesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminBadgesViewModel();
}
