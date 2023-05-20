import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/views/session_chooser/session_chooser_viewmodel.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:popover/popover.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';

class SessionChooserView extends StackedView<SessionChooserViewModel> {
  final String deckId;
  final String deckName;
  const SessionChooserView(this.deckId, this.deckName, {Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SessionChooserViewModel viewModel,
    Widget? child,
  ) {
    // viewModel.futureToRun();
    // print(viewModel.fetchedUser?.username.toString());
    return EMScaffold(
      appBar: EMAppBar(title: "Session Chooser"),
      bottomNavigationBar: const EMBottomBar(),
      // backgroundColor: GFColors.DARK,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpaceTiny,
              Column(
                children: [
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  //   child: GFTypography(
                  //     dividerColor: GFColors.WHITE,
                  //     type: GFTypographyType.typo2,
                  //     text: "Your Deck",
                  //     textColor: GFColors.WHITE,
                  //   ),
                  // ),
                  SizedBox(
                    height: 300,
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      image: Image.asset('your asset image'),
                      title: GFListTile(
                        // avatar: GFAvatar(
                        //   backgroundImage: AssetImage('your asset image'),
                        // ),
                        titleText: "Learning session",
                        // title: Text('Card Title'),
                        // subTitle: Text('Card Sub Title'),
                      ),
                      content:
                          Text("Some quick example text to build on the card"),
                      buttonBar: GFButtonBar(
                        children: <Widget>[
                          GFButton(
                            onPressed: () {
                              viewModel.toSessionLearningView(deckId);
                            },
                            text: 'Start learning',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      image: Image.asset('your asset image'),
                      title: GFListTile(
                        // avatar: GFAvatar(
                        //   backgroundImage: AssetImage('your asset image'),
                        // ),
                        title: Text('Card Title'),
                        subTitle: Text('Card Sub Title'),
                      ),
                      content:
                          Text("Some quick example text to build on the card"),
                      buttonBar: GFButtonBar(
                        children: <Widget>[
                          GFButton(
                            onPressed: () {},
                            text: 'Buy',
                          ),
                          GFButton(
                            onPressed: () {},
                            text: 'Cancel',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // );
  }

  @override
  SessionChooserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SessionChooserViewModel(deckName, deckId: deckId);
}
