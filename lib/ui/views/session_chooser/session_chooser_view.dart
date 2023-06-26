import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/views/session_chooser/session_chooser_viewmodel.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
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
      appBar: const EMAppBar(title: "Session Chooser"),
      bottomNavigationBar: const EMBottomBar(),
      // backgroundColor: GFColors.DARK,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deck: ${viewModel.deckName}',
                style: kcNormalText,
              ),
              verticalSpaceTiny,
              Expanded(
                flex: 1,
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kcCardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              'Learning Session',
                              style: kcTitleText,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Last session: Yesterday \nPending cards: ${viewModel.freshFlashcardsCount} \nReview cards: ${viewModel.reviewFlashcardsCount}',
                              style: kcNormalText,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GFButton(
                                    // color: Colors.,
                                    onPressed: () {
                                      viewModel.toSessionLearningView(deckId);
                                    },
                                    text: 'START LEARNING >',
                                    textStyle: kcNormalText,
                                  ),
                                ],
                              ))
                        ]),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Expanded(
                flex: 1,
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: kcCardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Text(
                              'Memory Games',
                              style: kcTitleText,
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Text(
                              'Play Memory Test Game with the cards that you have learned!',
                              style: kcNormalText,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GFButton(
                                    // color: Colors.,
                                    onPressed: () {
                                      viewModel.toGameMatchingView();
                                    },
                                    text: 'MATCH-THE-CARD',
                                    textStyle: kcNormalText,
                                  ),
                                  horizontalSpaceLarge,
                                  GFButton(
                                    // color: Colors.,
                                    onPressed: () {
                                      viewModel.toGameQuizView();
                                    },
                                    text: 'QUIZ GAME',
                                    textStyle: kcNormalText,
                                  ),
                                ],
                              ))
                        ]),
                  ),
                ),
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
