import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'home_admin_viewmodel.dart';

class HomeAdminView extends StackedView<HomeAdminViewModel> {
  const HomeAdminView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeAdminViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: 'ADMIN PANEL'),
      // bottomNavigationBar: const EMBottomBar(),

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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        const Icon(
                          Icons.badge,
                          size: 150,
                          color: GFColors.LIGHT,
                        ),
                        verticalSpaceMedium,
                        GFButton(
                            onPressed: () {
                              viewModel.toManageBadgesView();
                            },
                            color: Colors.amber,
                            text: 'Manage Badges',
                            textStyle: kcTitleText),

                        // verticalSpaceMedium,
                      ]),
                ),
              ),
              verticalSpaceMedium,
              Expanded(
                flex: 1,
                child: Container(
                  width: 350,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kcCardColor,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpaceMedium,
                        const Icon(
                          Icons.supervised_user_circle,
                          size: 150,
                          color: GFColors.LIGHT,
                        ),
                        verticalSpaceMedium,
                        GFButton(
                            onPressed: () {
                              viewModel.toModerateContentView();
                            },
                            color: Colors.amber,
                            text: 'Moderate Content',
                            textStyle: kcTitleText),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeAdminViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeAdminViewModel();
}
