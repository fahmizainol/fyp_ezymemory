import 'package:flutter/material.dart';
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
      appBar: EMAppBar(title: 'title'),
      bottomNavigationBar: EMBottomBar(),

      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceTiny,
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                    // child: GFTypography(
                    //   dividerColor: GFColors.WHITE,
                    //   type: GFTypographyType.typo2,
                    //   text: "Shared Decks",
                    //   textColor: GFColors.WHITE,
                    // ),
                  ),
                  // Container(
                  //   height: 70,
                  //   width: 200,
                  //   child: EasySearchBar(
                  //     // leading: Icon(Icons.abc),
                  //     title: Text('ff'),
                  //     onSearch: (value) {},
                  //     backgroundColor: GFColors.WHITE,
                  //   ),
                  // ),
                  SizedBox(
                    height: 500,
                  )
                ],
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
