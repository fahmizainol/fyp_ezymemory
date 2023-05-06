import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
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
    // viewModel.futureToRun();
    // print(viewModel.fetchedUser?.username.toString());
    return EMScaffold(
      appBar: EMAppBar(
          title: viewModel.isBusy
              ? "Welcome "
              : "Welcome ${viewModel.fetchedUser?.username}"),
      bottomNavigationBar: const EMBottomBar(),
      // backgroundColor: GFColors.DARK,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: viewModel.isBusy
                          ? const EMCircular()
                          : ListView.builder(
                              itemCount: viewModel.fetchedUserDeckList?.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: ((context, index) {
                                return GFListTile(
                                    icon: PopupMenuButton<int>(
                                        position: PopupMenuPosition.under,
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
                                                  child: Text("Edit deck")),
                                              const PopupMenuItem<int>(
                                                  value: 1,
                                                  child: Text("Delete deck")),
                                              const PopupMenuItem<int>(
                                                  value: 2,
                                                  child: Text("Share deck")),
                                            ]),
                                    color: GFColors.LIGHT,
                                    titleText: viewModel
                                            .fetchedUserDeckList?[index].name ??
                                        "",
                                    subTitleText: viewModel
                                            .fetchedUserDeckList?[index]
                                            .user_id ??
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
                      onPressed: viewModel.showDialog,
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
