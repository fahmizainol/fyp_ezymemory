import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Card(
            elevation: 0.0,
            margin: EdgeInsets.only(
                left: 32.0, right: 32.0, top: 32.0, bottom: 32.0),
            color: Color(0x00000000),
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              side: CardSide.FRONT,
              speed: 1000,
              onFlipDone: (status) {
                print(status);
              },
              front: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF006666),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Front', style: Theme.of(context).textTheme.headline1),
                    Text('Click here to flip back',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              back: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF006666),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Back', style: Theme.of(context).textTheme.headline1),
                    Text('Click here to flip front',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  @override
  SessionLearningViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SessionLearningViewModel(deckId: deckId);
}
