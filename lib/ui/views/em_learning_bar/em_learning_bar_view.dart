import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'em_learning_bar_viewmodel.dart';

class EmLearningBarView extends StackedView<EmLearningBarViewModel> {
  const EmLearningBarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EmLearningBarViewModel viewModel,
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
  EmLearningBarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmLearningBarViewModel();
}
