import 'package:flutter/material.dart';
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
      appBar: EMAppBar(title: 'Leaderboard'),
      bottomNavigationBar: EMBottomBar(),

      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  viewModel.isBusy
                      ? const EMCircular()
                      : DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  '',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  '',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  '',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                          // REF: https://api.flutter.dev/flutter/material/DataTable-class.html
                          rows: List<DataRow>.generate(
                            viewModel.fetchedUserList!.length,
                            (int index) => DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                return Colors.grey.withOpacity(0.3);
                                // Use default value for other states and odd rows.
                              }),
                              cells: <DataCell>[
                                DataCell(Text(
                                  '${index + 1}. ',
                                  style: TextStyle(color: GFColors.LIGHT),
                                )),
                                DataCell(Text(
                                    '${viewModel.fetchedUserList![index].username}',
                                    style: TextStyle(color: GFColors.LIGHT))),
                                DataCell(Text(
                                    '${viewModel.fetchedUserList![index].currentPoints} pts',
                                    style: TextStyle(color: Colors.amber)))
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
            )),
      ),
    );
  }

  @override
  LeaderboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LeaderboardViewModel();
}
