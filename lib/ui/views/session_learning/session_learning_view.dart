import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_learning_bottombar.dart';
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
      appBar: const EMAppBar(title: "Learning Session"),
      // bottomNavigationBar: const EMLearningBottomBar(),
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            children: [
              Container(
                height: 600,
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 16.0, bottom: 16.0),
                  color: const Color(0x00000000),
                  child: FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    side: CardSide.FRONT,
                    speed: 1000,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      width: 800,
                      decoration: const BoxDecoration(
                        color: Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: viewModel.isBusy
                          ? const EMCircular()
                          : Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    viewModel
                                        .fetchedFlashcardsList![viewModel.count]
                                        .front,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                Text('Click here to flip back',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                    ),
                    back: Container(
                      width: 800,
                      decoration: const BoxDecoration(
                        color: Color(0xFF006666),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: viewModel.isBusy
                          ? const EMCircular()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    viewModel
                                        .fetchedFlashcardsList![viewModel.count]
                                        .back,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                Text('Click here to flip front',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GFButton(
                    onPressed: () {
                      viewModel.nextCard();
                    },
                    text: 'Easy',
                    size: GFSize.LARGE,
                    // color: GF,
                  ),
                  GFButton(
                    onPressed: () {},
                    text: 'Good',
                    size: GFSize.LARGE,
                    color: GFColors.SUCCESS,
                  ),
                  GFButton(
                      onPressed: () {},
                      text: 'Hard',
                      size: GFSize.LARGE,
                      color: GFColors.DANGER)
                ],
              )
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
