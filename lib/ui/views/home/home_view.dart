import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(
          title: viewModel.isBusy
              ? "Welcome, !"
              : "Welcome, ${viewModel.fetchedUser?.username}!"),
      bottomNavigationBar: const EMBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Column(
            children: [
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
                          child: SingleChildScrollView(
                            child: Column(
                                //TODO: make it scrollable to avoid overflow
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpaceSmall,
                                  DataTable(
                                    dataRowMinHeight: 25,
                                    dataRowMaxHeight: 100,
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
                                        onLongPress: () {},
                                        cells: <DataCell>[
                                          DataCell(
                                              onTap: () => viewModel
                                                  .toSessionChooserView(
                                                      viewModel
                                                              .fetchedUserDeckList?[
                                                                  index]
                                                              .id ??
                                                          "",
                                                      viewModel
                                                              .fetchedUserDeckList?[
                                                                  index]
                                                              .name ??
                                                          ""),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  verticalSpaceSmall,
                                                  Text(
                                                      '${viewModel.fetchedUserDeckList?[index].name}',
                                                      style: kcNormalText),
                                                  verticalSpaceSmall,
                                                  Text(
                                                      'Category: ${viewModel.fetchedUserDeckList?[index].category}',
                                                      style: kcNormalText3),
                                                  Text(
                                                      'Date: ${viewModel.fetchedUserDeckList?[index].lastFetchedTime}',
                                                      style: kcNormalText3),
                                                ],
                                              )),
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
                                ]),
                          ),
                        ),
                ),
              ),
              verticalSpaceTiny,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
