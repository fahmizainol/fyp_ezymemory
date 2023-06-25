import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'session_learning_viewmodel.dart';

class SessionLearningView extends StackedView<SessionLearningViewModel> {
  final String deckId;
  const SessionLearningView(this.deckId, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SessionLearningViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      floatingButton: PopupMenuButton<int>(
          position: PopupMenuPosition.over,
          onSelected: (int value) {
            viewModel.debugMenuLogic(value);
          },
          itemBuilder: (context) => [
                const PopupMenuItem<int>(
                    value: 0, child: Text("[D] Reset SM2 stats")),
                // const PopupMenuItem<int>(
                //     value: 0, child: Text("[D] Reset SM2 stats")),
              ]),
      appBar: EMAppBar(title: "Learning Session", actions: [
        viewModel.isBusy
            ? const EMCircular()
            : Row(
                children: [
                  Text(viewModel.freshFlashcardsCount.toString(),
                      style: const TextStyle(color: GFColors.SUCCESS)),
                  horizontalSpaceSmall,
                  Text(viewModel.reviewFlashcardsCount.toString(),
                      style: const TextStyle(color: GFColors.DANGER)),
                  horizontalSpaceMedium,
                ],
              )
      ]),
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Stack(
            children: [
              Visibility(
                // TODO: change the card color of the front and back cards
                visible: viewModel.frontVisible,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: GFColors.WHITE,
                      width: 350,
                      height: 600,
                      child: Card(
                        elevation: 0.0,
                        margin: const EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 16.0, bottom: 16.0),
                        color: const Color(0x00000000),
                        child: viewModel.isBusy
                            ? const EMCircular()
                            : Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('Question'),
                                  verticalSpaceMassive,
                                  verticalSpaceMassive,
                                  Center(
                                    child: Text(
                                        viewModel
                                            .fetchedFlashcardsList![
                                                viewModel.count]
                                            .front,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GFButton(
                          onPressed: () {
                            print('show ans');
                            viewModel.showAns();
                          },
                          text: 'Show answer',
                          size: GFSize.LARGE,
                          color: GFColors.SUCCESS,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Visibility(
                visible: viewModel.frontVisible == false,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      color: GFColors.WHITE,
                      width: 350,
                      height: 600,
                      child: Card(
                        elevation: 0.0,
                        margin: const EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 16.0, bottom: 16.0),
                        color: const Color(0x00000000),
                        child: viewModel.isBusy
                            ? const EMCircular()
                            : Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text('Answer'),
                                  verticalSpaceMassive,
                                  verticalSpaceMassive,
                                  // GFTypography(
                                  //   text: viewModel
                                  //       .fetchedFlashcardsList![viewModel.count]
                                  //       .back,
                                  //   showDivider: false,
                                  //   type: GFTypographyType.typo1,
                                  // )
                                  Center(
                                    child: Text(
                                        viewModel
                                            .fetchedFlashcardsList![
                                                viewModel.count]
                                            .back,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GFButton(
                          onPressed: () {
                            viewModel.updateFlashcard(5);
                          },
                          text: 'Easy',
                          size: GFSize.LARGE,
                          // color: GF,
                        ),
                        GFButton(
                          onPressed: () {
                            viewModel.updateFlashcard(3);
                          },
                          text: 'Good',
                          size: GFSize.LARGE,
                          color: GFColors.SUCCESS,
                        ),
                        GFButton(
                            onPressed: () {
                              viewModel.updateFlashcard(0);
                            },
                            text: 'Hard',
                            size: GFSize.LARGE,
                            color: GFColors.DANGER)
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  SessionLearningViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SessionLearningViewModel(deckId: deckId);
}
