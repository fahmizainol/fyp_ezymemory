import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:stacked/stacked.dart';

import 'admin_moderate_viewmodel.dart';

class AdminModerateView extends StackedView<AdminModerateViewModel> {
  const AdminModerateView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AdminModerateViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EasySearchBar(
        // leading: Icon(Icons.abc),
        title: Text('Import Deck', style: kcAppBarText),
        iconTheme: IconThemeData(color: Colors.white),
        searchCursorColor: GFColors.WHITE,
        // foregroundColor: GFColors.DARK,
        searchBackgroundColor: GFColors.WHITE,
        onSearch: (value) {},
        backgroundColor: GFColors.DARK,
        // suggestions: ,
      ),
      bottomNavigationBar: EMBottomBar(),

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
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Community Deck                                ',
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
                                      viewModel.fetchedDeckListLength,
                                      (int index) => DataRow(
                                        // color: MaterialStateProperty.resolveWith<
                                        //     Color?>((Set<MaterialState> states) {
                                        //   return kcCardColor;
                                        //   // Use default value for other states and odd rows.
                                        // }),
                                        cells: <DataCell>[
                                          DataCell(Text(
                                              '${viewModel.fetchedDeckList?[index].name}',
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
                                                              .fetchedDeckList?[
                                                                  index]
                                                              .id ??
                                                          "",
                                                      viewModel
                                                              .fetchedDeckList?[
                                                                  index]
                                                              .name ??
                                                          "");
                                                },
                                                itemBuilder: (context) => [
                                                      const PopupMenuItem<int>(
                                                          value: 0,
                                                          child: Text(
                                                              "Delete deck")),
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
              verticalSpaceTiny,
            ],
          ),
        ),
      ),
    );
  }

  @override
  AdminModerateViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminModerateViewModel();
}
