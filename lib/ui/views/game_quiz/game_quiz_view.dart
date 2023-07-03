import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/app_colors.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'game_quiz_viewmodel.dart';

class GameQuizView extends StackedView<GameQuizViewModel> {
  final String deckId;
  GameQuizView(this.deckId, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget builder(
    BuildContext context,
    GameQuizViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: 'Quiz Game'),

      // backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: viewModel.isBusy
              ? const EMCircular()
              : FormBuilder(
                  key: _formKey,
                  child: Column(mainAxisSize: MainAxisSize.max, children: [
                    // verticalSpaceMedium,
                    Expanded(
                      child: ListView.builder(
                        // key: UniqueKey(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: viewModel.fetchedFlashcardsList!.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(5),
                          height: 450,
                          width: 350,
                          // child: Text('fff'),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: kcCardColor,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                verticalSpaceMedium,
                                Text('QUESTION ${index + 1}:',
                                    style: kcTitleText),
                                const Divider(color: GFColors.LIGHT),
                                verticalSpaceMedium,
                                Text(
                                  viewModel.fetchedFlashcardsList![index].front,
                                  style: kcTitleText,
                                ),
                                verticalSpaceLarge,
                                FormBuilderRadioGroup(
                                  key: UniqueKey(),
                                  orientation: OptionsOrientation.vertical,
                                  decoration: const InputDecoration(
                                      labelText: 'Choose one of the answers:',
                                      labelStyle: kcNormalText),
                                  name: 'ans',
                                  options: viewModel.ansList![index].map((ans) {
                                    return FormBuilderFieldOption(
                                      value: ans,
                                      child: Text(
                                        ans,
                                        style: kcNormalText,
                                      ),
                                    );
                                  }).toList(growable: false),
                                  onChanged: (value) =>
                                      viewModel.changeAnsValue(index, value),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    GFButton(
                      textColor: GFColors.DARK,
                      color: GFColors.LIGHT,
                      onPressed: () async {
                        // Implement login functionality here
                        viewModel.checkAns();
                      },
                      child: const Text('Submit Answer'),
                    )
                  ]),
                ),

          // ],
          // ),
        ),
      ),
      // ),
    );
  }

  @override
  GameQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameQuizViewModel(deckId: deckId);
}
