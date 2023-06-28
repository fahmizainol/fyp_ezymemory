import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'create_flashcard_viewmodel.dart';

class CreateFlashcardView extends StackedView<CreateFlashcardViewModel> {
  final String deckId;
  final String deckName;
  CreateFlashcardView(this.deckId, this.deckName, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  bool submitBtnClicked = false;
  // String dropdownValue = "Others";

  @override
  Widget builder(
    BuildContext context,
    CreateFlashcardViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: "Create Flashcard"),
      bottomNavigationBar: const EMBottomBar(),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: submitBtnClicked
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: viewModel.isBusy
              ? const EMCircular()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceMedium,
                        const GFTypography(
                            text:
                                "Please fill in the question and answer fields",
                            textColor: GFColors.WHITE,
                            showDivider: false),
                        // FormBuilderTextField(name: 'name'),
                        // formbuilder
                        verticalSpaceMedium,
                        GFTypography(
                            text: "Deck: $deckName",
                            type: GFTypographyType.typo5,
                            fontWeight: FontWeight.normal,
                            textColor: GFColors.WHITE,
                            showDivider: false),
                        // FormBuilderTextField(name: 'name'),
                        // formbuilder
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          style: const TextStyle(color: GFColors.WHITE),
                          // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                          decoration: const InputDecoration(
                            labelText: 'Front (Question)',
                            labelStyle: TextStyle(color: GFColors.WHITE),
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'front',
                          // initialValue: viewModel.deckName,
                          onChanged: (val) => viewModel.changeFront(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          style: const TextStyle(color: GFColors.WHITE),
                          // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                          decoration: const InputDecoration(
                            labelText: 'Back (Answer)',
                            labelStyle: TextStyle(color: GFColors.WHITE),
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'back',
                          // initialValue: viewModel.deckName,
                          onChanged: (val) => viewModel.changeBack(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),
                        verticalSpaceMedium,
                        GFButton(
                          textColor: GFColors.DARK,
                          color: GFColors.LIGHT,
                          onPressed: () async {
                            // Implement login functionality here
                            var res = await viewModel.createNewFlashcard(
                                deckId,
                                viewModel.front.toString(),
                                viewModel.back.toString());
                            _formKey.currentState!.reset();
                          },
                          child: const Text('Save Card'),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  @override
  CreateFlashcardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateFlashcardViewModel(
        deckName,
        deckId: deckId,
      );
}
