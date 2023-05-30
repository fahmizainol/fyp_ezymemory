import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:popover/popover.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';
import 'widgets/gesture_popover.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    // viewModel.initialise();
    // viewModel.futureToRun();
    // viewModel.stream();
    // print(viewModel.fetchedUser?.username.toString());
    return EMScaffold(
      // floatingButton: FloatingActionButton.small(onPressed: () {
      //   viewModel.addPoints(0);
      // }),
      appBar: EMAppBar(
          title: viewModel.isBusy
              ? "Welcome, !"
              : "Welcome, ${viewModel.fetchedUser?.username}!"),
      bottomNavigationBar: EMBottomBar(),
      // backgroundColor: GFColors.DARK,
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                verticalSpaceSmall,
                                Expanded(
                                  flex: 5,
                                  child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Your Deck                                   ',
                                            style: kcTitleText,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            '',
                                            style: kcTitleText,
                                          ),
                                        ),
                                      ),
                                    ],
                                    // REF: https://api.flutter.dev/flutter/material/DataTable-class.html
                                    rows: List<DataRow>.generate(
                                      viewModel.fetchedUserDeckListLength,
                                      (int index) => DataRow(
                                        // color: MaterialStateProperty.resolveWith<
                                        //     Color?>((Set<MaterialState> states) {
                                        //   return kcCardColor;
                                        //   // Use default value for other states and odd rows.
                                        // }),
                                        cells: <DataCell>[
                                          DataCell(Text(
                                              '${viewModel.fetchedUserDeckList?[index].name}',
                                              style: kcNormalText)),
                                          DataCell(
                                            PopupMenuButton<int>(
                                                color: Colors.amber,
                                                position:
                                                    PopupMenuPosition.under,
                                                onSelected: (int value) {
                                                  viewModel.popupMenuLogic(
                                                      value,
                                                      viewModel
                                                              .fetchedUserDeckList?[
                                                                  index]
                                                              .id ??
                                                          "",
                                                      viewModel
                                                              .fetchedUserDeckList?[
                                                                  index]
                                                              .name ??
                                                          "");
                                                },
                                                itemBuilder: (context) => [
                                                      const PopupMenuItem<int>(
                                                          value: 0,
                                                          child: Text(
                                                              "Edit deck")),
                                                      const PopupMenuItem<int>(
                                                          value: 1,
                                                          child: Text(
                                                              "Delete deck")),
                                                      const PopupMenuItem<int>(
                                                          value: 3,
                                                          child: Text(
                                                              "Add cards")),
                                                      const PopupMenuItem<int>(
                                                          value: 4,
                                                          child: Text(
                                                              "Study deck")),
                                                    ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                // verticalSpaceMassive,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GFButton(
                                      color: kcDarkGreyColor,
                                      // onPressed: () async {
                                      //   Navigator.pushNamed(context, Routes.importDeckView)
                                      //       .then((_) => viewModel.initialise());
                                      // },
                                      onPressed: viewModel.toImportDeckView,
                                      child: const Text(
                                        'Import Deck +',
                                        style: kcNormalText,
                                      ),
                                    ),
                                    GFButton(
                                      color: kcDarkGreyColor,
                                      onPressed: viewModel.toCreateDeckView,
                                      child: const Text(
                                        'Create Deck +',
                                        style: kcNormalText,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                ),
              ),
              verticalSpaceTiny,
            ],
          ),
        ),
      ),
    );
    // );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
