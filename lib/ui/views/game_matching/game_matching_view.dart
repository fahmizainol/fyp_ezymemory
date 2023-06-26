import 'package:flutter/material.dart';
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
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
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
                                child: Container(),
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
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
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
