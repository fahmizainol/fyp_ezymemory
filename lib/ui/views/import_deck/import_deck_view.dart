import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'import_deck_viewmodel.dart';

class ImportDeckView extends StackedView<ImportDeckViewModel> {
  const ImportDeckView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ImportDeckViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EasySearchBar(
        // leading: Icon(Icons.abc),
        title: Text('Import Deck', style: TextStyle(color: GFColors.WHITE)),
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
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceTiny,
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                    // child: GFTypography(
                    //   dividerColor: GFColors.WHITE,
                    //   type: GFTypographyType.typo2,
                    //   text: "Shared Decks",
                    //   textColor: GFColors.WHITE,
                    // ),
                  ),
                  // Container(
                  //   height: 70,
                  //   width: 200,
                  //   child: EasySearchBar(
                  //     // leading: Icon(Icons.abc),
                  //     title: Text('ff'),
                  //     onSearch: (value) {},
                  //     backgroundColor: GFColors.WHITE,
                  //   ),
                  // ),
                  SizedBox(
                    height: 500,
                    child: viewModel.isBusy
                        ? const EMCircular()
                        : ListView.builder(
                            itemCount: viewModel.fetchedDeckList?.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return GFListTile(
                                  icon: IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () async {
                                      await viewModel.importDeck(
                                          viewModel.fetchedDeckList![index]);
                                      // Navigator.pop(context);
                                    },
                                  ),
                                  color: GFColors.LIGHT,
                                  // margin: EdgeInsets.fromLTRB(0, -5, 0, -10),
                                  shadow: BoxShadow(blurRadius: 0),
                                  // title: Text('tes'),
                                  titleText:
                                      viewModel.fetchedDeckList?[index].name ??
                                          "",
                                  subTitleText: viewModel
                                          .fetchedDeckList?[index].category ??
                                      "");
                            })),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ImportDeckViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ImportDeckViewModel();
}
