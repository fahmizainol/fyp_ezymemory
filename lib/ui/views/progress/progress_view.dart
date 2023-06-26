import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'progress_viewmodel.dart';

class ProgressView extends StackedView<ProgressViewModel> {
  const ProgressView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProgressViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: 'Progress'),
      bottomNavigationBar: const EMBottomBar(),

      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceTiny,
              Expanded(
                flex: 1,
                child: Container(
                  width: 350,
                  height: 300,
                  // child: Text('fff'),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kcCardColor,
                  ),
                  child: viewModel.isBusy
                      ? const EMCircular()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              verticalSpaceMedium,
                              const Text(
                                'Current Points',
                                style: kcTitleText,
                              ),
                              verticalSpaceMedium,
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.green,
                                    style: BorderStyle.solid,
                                  ),
                                  //more than 50% of width makes circle
                                ),
                                child: Center(
                                  child: Text(
                                    viewModel.fetchedUser!.currentPoints
                                        .toString(),
                                    style: kcTitleText,
                                  ),
                                ),
                              ),
                            ]),
                ),
              ),
              verticalSpaceMedium,
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.blueGrey.withOpacity(0.25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProgressViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProgressViewModel();
}
