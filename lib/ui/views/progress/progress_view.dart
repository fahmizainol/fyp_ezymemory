import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/views/progress/deck_stats.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
              Expanded(
                flex: 1,
                child: Container(
                  width: 350,
                  height: 50,
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
                              verticalSpaceSmall,
                              const Text(
                                'Statistics',
                                style: kcTitleText,
                              ),
                              verticalSpaceMedium,
                              Container(
                                  child: SfCartesianChart(
                                      title: ChartTitle(
                                          text: 'Deck Category Count',
                                          textStyle: kcNormalText3),
                                      // Enable legend
                                      // legend: Legend(isVisible: true),
                                      // Initialize category axis
                                      primaryXAxis: CategoryAxis(),
                                      series: <BarSeries<DeckStats, String>>[
                                    BarSeries<DeckStats, String>(
                                      dataSource: List.generate(
                                          viewModel.deckStatsList!.length,
                                          (index) {
                                        return viewModel.deckStatsList![index];
                                      }),
                                      xValueMapper: (DeckStats deck, _) =>
                                          deck.category,
                                      yValueMapper: (DeckStats deck, _) =>
                                          deck.count,
                                    )
                                  ])),
                            ]),
                ),
              ),
              verticalSpaceSmall,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 350,
                      height: 200,
                      // child: Text('fff'),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: kcCardColor,
                      ),
                      child: viewModel.isBusy
                          ? const EMCircular()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  verticalSpaceSmall,
                                  const Text(
                                    'Current Points',
                                    style: kcNormalText,
                                  ),
                                  verticalSpaceMedium,
                                  Container(
                                    height: 80,
                                    width: 80,
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
                                        style: kcNormalText,
                                      ),
                                    ),
                                  ),
                                ]),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 350,
                      height: 200,
                      // child: Text('fff'),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: kcCardColor,
                      ),
                      child: viewModel.isBusy
                          ? const EMCircular()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  verticalSpaceSmall,
                                  const Text(
                                    'Badges List',
                                    style: kcNormalText,
                                  ),
                                  verticalSpaceSmall,
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          viewModel.userStatsList!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Image(
                                              height: 60,
                                              width: 60,
                                              image: NetworkImage(
                                                viewModel.userStatsList?[index]
                                                        .image ??
                                                    '',
                                              ),
                                            ),
                                            Text(
                                              '${viewModel.userStatsList![index].name}',
                                              style: kcNormalText3,
                                            ),
                                            verticalSpaceSmall,
                                          ],
                                        );
                                      },
                                    ),
                                  )

                                  // Expanded(
                                  //   child: GridView.count(
                                  //     crossAxisCount: 3, // Number of columns
                                  //     children: List.generate(
                                  //         viewModel.userStatsList!.length,
                                  //         (index) {
                                  //       return Image(
                                  //         height: 20,
                                  //         width: 20,
                                  //         image: NetworkImage(
                                  //           viewModel.userStatsList?[index]
                                  //                   .image ??
                                  //               '',
                                  //         ),
                                  //       );
                                  //     }),
                                  //   ),
                                  // ),
                                ]),
                    ),
                  ),
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
