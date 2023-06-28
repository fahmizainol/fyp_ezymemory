import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:stacked/stacked.dart';

import 'game_matching_viewmodel.dart';

class GameMatchingView extends StackedView<GameMatchingViewModel> {
  final String deckId;
  const GameMatchingView(this.deckId, {Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameMatchingViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(
        title: 'MATCH-THE-CARD',
      ),
      // bottomNavigationBar: EMBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Center(
              child: viewModel.isBusy
                  ? const EMCircular()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Text('data'),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                viewModel.flashcardsListCount, (index) {
                              return Expanded(
                                child: InkWell(
                                  onTap: () {
                                    viewModel.changeLeftSelectedBoxIndex(index);
                                    viewModel.compareCards();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: viewModel.matchedQuestions![index]
                                          ? Colors.grey
                                          : Colors.blue,
                                      border: index ==
                                              viewModel.leftSelectedBoxIndex
                                          ? Border.all(
                                              color: Colors.white, width: 5)
                                          : Border.all(
                                              color: Colors.yellow, width: 0),
                                    ),
                                    margin: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        viewModel.questions![index][0],
                                        style: kcNormalText,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: List.generate(
                                viewModel.flashcardsListCount, (index) {
                              return Expanded(
                                child: Container(
                                    child: index == 0
                                        ? Column(
                                            children: [
                                              Text(
                                                'Score: ${viewModel.points}',
                                                style: kcNormalText,
                                              ),
                                              viewModel.ansStatus != ''
                                                  ? Text(
                                                      '${viewModel.ansStatus}!',
                                                      style: kcNormalText,
                                                    )
                                                  : Text(
                                                      '',
                                                      style: kcNormalText,
                                                    )
                                            ],
                                          )
                                        : Text('')),
                              );
                            }),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(
                                viewModel.flashcardsListCount, (index) {
                              return Expanded(
                                child: InkWell(
                                  onTap: () {
                                    viewModel
                                        .changeRightSelectedBoxIndex(index);
                                    viewModel.compareCards();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: viewModel.matchedAns![index]
                                          ? Colors.grey
                                          : Colors.blue,
                                      border: index ==
                                              viewModel.rightSelectedBoxIndex
                                          ? Border.all(
                                              color: Colors.white, width: 5)
                                          : Border.all(
                                              color: Colors.yellow, width: 0),
                                    ),
                                    margin: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        viewModel.ans![index][1],
                                        style: kcNormalText,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    )),
        ),
      ),
    );
  }

  @override
  GameMatchingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameMatchingViewModel(deckId: deckId);
}
