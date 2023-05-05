import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'counter_viewmodel.dart';

class CounterView extends StackedView<CounterViewModel> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CounterViewModel viewModel,
    Widget? child,
  ) {
    // final pukimak = await viewModel.fuck();
    // viewModel.getUser();
    // viewModel.futureToRun();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: // viewModel will indicate busy until the future is fetched
            // viewModel.isBusy
            //     ? const CircularProgressIndicator()
            //     : Text(viewModel.user!.email.toString()),
            viewModel.isBusy
                ? const CircularProgressIndicator()
                : Text(viewModel.fetchedDeckList.toString()),
        // viewModel.isBusy
        //     ? const CircularProgressIndicator()
        //     : Text(viewModel.fetchedDeck.toString()),
        // viewModel.isBusy
        //     ? const CircularProgressIndicator()
        //     : Text(viewModel.fuckthisshit.toString()),
      ),
    );
  }

  @override
  CounterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CounterViewModel();
}
