import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
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
      floatingButton: FloatingActionButton.small(onPressed: () {
        viewModel.addPoints(0);
      }),
      appBar: EMAppBar(
          title: viewModel.isBusy
              ? "Welcome, null!"
              : "Welcome, ${viewModel.fetchedUser?.username}!"),
      bottomNavigationBar: EMBottomBar(),
      // backgroundColor: GFColors.DARK,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceTiny,
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                    child: GFTypography(
                      dividerColor: GFColors.WHITE,
                      type: GFTypographyType.typo2,
                      text: "Your Deck",
                      textColor: GFColors.WHITE,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: viewModel.isBusy
                        ? const EMCircular()
                        : ListView.builder(
                            key: UniqueKey(),
                            itemCount: viewModel.fetchedUserDeckList?.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              // key:
                              // viewModel.fetchedUserDeckList?[index].id;
                              return GFListTile(
                                  icon: PopupMenuButton<int>(
                                      position: PopupMenuPosition.under,
                                      onSelected: (int value) {
                                        viewModel.popupMenuLogic(
                                            value,
                                            viewModel
                                                    .fetchedUserDeckList?[index]
                                                    .id ??
                                                "",
                                            viewModel
                                                    .fetchedUserDeckList?[index]
                                                    .name ??
                                                "");
                                      },
                                      itemBuilder: (context) => [
                                            const PopupMenuItem<int>(
                                                value: 0,
                                                child: Text("Edit deck")),
                                            const PopupMenuItem<int>(
                                                value: 1,
                                                child: Text("Delete deck")),
                                            const PopupMenuItem<int>(
                                                value: 2,
                                                child: Text("Share deck")),
                                            const PopupMenuItem<int>(
                                                value: 3,
                                                child: Text("Add cards")),
                                            const PopupMenuItem<int>(
                                                value: 4,
                                                child: Text("Study deck")),
                                          ]),
                                  color: GFColors.LIGHT,
                                  // margin: EdgeInsets.fromLTRB(0, -5, 0, -10),
                                  shadow: BoxShadow(blurRadius: 0),
                                  // title: Text('tes'),
                                  titleText: viewModel
                                          .fetchedUserDeckList?[index].name ??
                                      "",
                                  subTitleText: viewModel
                                          .fetchedUserDeckList?[index]
                                          .category ??
                                      "");
                            })),
                  )
                ],
              ),
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GFButton(
                    color: kcDarkGreyColor,
                    onPressed: viewModel.toCreateDeckView,
                    child: const Text(
                      'Create Deck +',
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
