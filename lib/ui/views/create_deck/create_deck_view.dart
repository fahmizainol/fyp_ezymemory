import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/views/create_deck/create_deck_view.form.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_deck_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'deckName',
  ),
])
class CreateDeckView extends StackedView<CreateDeckViewModel>
    with $CreateDeckView {
  CreateDeckView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  bool submitBtnClicked = false;
  // String dropdownValue = "Others";

  @override
  Widget builder(
    BuildContext context,
    CreateDeckViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: "Create Deck"),
      bottomNavigationBar: const EMBottomBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: submitBtnClicked
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                const GFTypography(
                    text: "Please fill the deck name and category",
                    textColor: GFColors.WHITE,
                    showDivider: false),
                verticalSpaceMedium,
                FormBuilderTextField(
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: deckNameController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    labelText: 'Deck Name',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'deckName',
                  // validator: CreateDeckValidators.validateDeckName,
                ),
                verticalSpaceMedium,
                FormBuilderDropdown<String>(
                  alignment: Alignment.bottomRight,
                  style: const TextStyle(
                    color: GFColors.WHITE,
                  ),
                  dropdownColor: GFColors.DARK, isDense: true,
                  initialValue: viewModel.currentDropdownValue,
                  name: 'category',
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                  ),
                  // validator: FormBuilderValidators.compose(
                  //     [FormBuilderValidators.required()]),
                  items: <String>[
                    'Science',
                    'Chemistry',
                    'Biology',
                    'Programming',
                    'Math',
                    'English',
                    'French',
                    'Japanese',
                    'Others'
                  ]
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (val) {
                    viewModel.changeDropdownValue(val);
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                verticalSpaceMedium,
                GFButton(
                  textColor: GFColors.DARK,
                  color: GFColors.LIGHT,
                  onPressed: () {
                    // Implement login functionality here
                    // if (_formKey.currentState!.validate()) {
                    // print(_formKey.currentState.);
                    viewModel.createNewDeck(deckNameController.text,
                        viewModel.currentDropdownValue);
                    // } else {
                    // submitBtnClicked = true;
                    // }
                  },
                  child: const Text('Create Deck'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreateDeckViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateDeckViewModel();
}
