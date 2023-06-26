import 'package:flutter/material.dart';
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
                : GridView.count(
                    crossAxisCount: 3, // Number of columns
                    children: List.generate(viewModel.flashcardsListCount * 3,
                        (index) {
                      if ((index + 1) % 3 == 2) {
                        // Skip the middle column
                        return Container();
                      } else if ((index + 1) % 3 == 1) {
                        // Display content in other columns
                        return InkWell(
                          onTap: () {
                            print('fsdf');
                            viewModel.changeLeftSelectedBoxIndex(index);
                            // IDEA: tap any boxes in the first column, then the rest of the boxes will not be tappable
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: index == viewModel.leftSelectedBoxIndex ||
                                      index ==
                                          viewModel.leftPrevSelectedBoxIndex
                                  ? Border.all(color: Colors.white, width: 5)
                                  : Border.all(color: Colors.yellow, width: 0),
                              // boxShadow:

                              // borderRadius: BorderRadius.all(Radius.circular(radius))
                            ),

                            // color: index == viewModel.selectedBoxIndex
                            //     ? Colors.blue
                            //     : Colors.grey,
                            margin: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'viewModel.fetchedFlashcardsList![index].front',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            print('fsdf');
                            viewModel.changeRightSelectedBoxIndex(index);
                            // IDEA: tap any boxes in the first column, then the rest of the boxes will not be tappable
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: index ==
                                          viewModel.rightSelectedBoxIndex ||
                                      index ==
                                          viewModel.rightPrevSelectedBoxIndex
                                  ? Border.all(color: Colors.white, width: 5)
                                  : Border.all(color: Colors.yellow, width: 0),
                              // boxShadow:

                              // borderRadius: BorderRadius.all(Radius.circular(radius))
                            ),

                            // color: index == viewModel.selectedBoxIndex
                            //     ? Colors.blue
                            //     : Colors.grey,
                            margin: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'viewModel.fetchedFlashcardsList![index].back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }),
                  ),
          ),
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
