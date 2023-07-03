import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'admin_badges_viewmodel.dart';

class AdminBadgesView extends StackedView<AdminBadgesViewModel> {
  AdminBadgesView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget builder(
    BuildContext context,
    AdminBadgesViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(title: 'Manage Badges'),

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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kcCardColor,
                  ),
                  child: viewModel.isBusy
                      ? const EMCircular()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpaceSmall,
                                  DataTable(
                                    dataRowMinHeight: 20,
                                    dataRowMaxHeight: 80,
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            '',
                                            style: kcTitleText,
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Badge List                        ',
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
                                      viewModel.fetchedBadgeListLength,
                                      (int index) => DataRow(
                                        // color: MaterialStateProperty.resolveWith<
                                        //     Color?>((Set<MaterialState> states) {
                                        //   return kcCardColor;
                                        //   // Use default value for other states and odd rows.
                                        // }),
                                        cells: <DataCell>[
                                          DataCell(Image(
                                            height: 40,
                                            width: 40,
                                            image: NetworkImage(
                                              viewModel.fetchedBadgeList?[index]
                                                      .image ??
                                                  '',
                                            ),
                                          )),
                                          DataCell(Text(
                                              '${viewModel.fetchedBadgeList?[index].name}',
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
                                                              .fetchedBadgeList?[
                                                                  index]
                                                              .id ??
                                                          "",
                                                      viewModel
                                                              .fetchedBadgeList?[
                                                                  index]
                                                              .name ??
                                                          "");
                                                },
                                                itemBuilder: (context) => [
                                                      const PopupMenuItem<int>(
                                                          value: 0,
                                                          child: Text(
                                                              "Delete Badge")),
                                                      const PopupMenuItem<int>(
                                                          value: 1,
                                                          child: Text(
                                                              "Edit Badge")),
                                                    ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  // verticalSpaceMassive,
                                ]),
                          ),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFButton(
                    color: kcDarkGreyColor,
                    onPressed: () {
                      viewModel.toCreateBadgeView();
                    },
                    child: const Text(
                      'Create Badge +',
                      style: kcNormalText,
                    ),
                  ),
                ],
              ),
              verticalSpaceTiny,
            ],
          ),
        ),
      ),
    );
  }

  @override
  AdminBadgesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminBadgesViewModel();
}
