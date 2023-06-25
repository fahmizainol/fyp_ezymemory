import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'leaderboard_viewmodel.dart';

class LeaderboardView extends StackedView<LeaderboardViewModel> {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LeaderboardViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
        appBar: const EMAppBar(title: 'Leaderboard'),
        bottomNavigationBar: const EMBottomBar(),

        // backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // verticalSpaceMedium,
                Expanded(
                    flex: 1,
                    child: Container(
                        width: 400,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: kcCardColor,
                        ),
                        child: viewModel.isBusy
                            ? const EMCircular()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'data',
                                    //   style: kcTitleText,
                                    // ),
                                    verticalSpaceSmall,
                                    viewModel.isBusy
                                        ? const EMCircular()
                                        : DataTable(
                                            columns: const <DataColumn>[
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    '',
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    'Top 100 User \nAll Time\n',
                                                    style: kcTitleText,
                                                  ),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Expanded(
                                                  child: Text(
                                                    '',
                                                    style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                ),
                                              ),
                                            ],
                                            // REF: https://api.flutter.dev/flutter/material/DataTable-class.html
                                            rows: List<DataRow>.generate(
                                              viewModel.fetchedUserList!.length,
                                              (int index) => DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    '${index + 1}. ',
                                                    style: const TextStyle(
                                                        color: GFColors.LIGHT),
                                                  )),
                                                  DataCell(Text(
                                                      viewModel.fetchedUserList![index].username,
                                                      style: const TextStyle(
                                                          color:
                                                              GFColors.LIGHT))),
                                                  DataCell(Text(
                                                      '${viewModel.fetchedUserList![index].currentPoints} pts',
                                                      style: const TextStyle(
                                                          color: Colors.amber)))
                                                ],
                                                // selected: selected[index],
                                                // onSelectChanged: (bool? value) {
                                                //   setState(() {
                                                //     selected[index] = value!;
                                                //   });
                                                // },
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ))),
              ]),
        )));
  }

  @override
  LeaderboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeaderboardViewModel();
}
