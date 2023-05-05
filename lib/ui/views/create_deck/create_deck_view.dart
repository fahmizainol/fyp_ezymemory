import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/views/create_deck/create_deck_view.form.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_deck_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'deckName',
  ),
  FormDropdownField(name: "category", items: [
    StaticDropdownItem(title: "title", value: "value"),
    StaticDropdownItem(
      title: 'Science',
      value: 'Science',
    ),
    StaticDropdownItem(
      title: 'Chemistry',
      value: 'Chemistry',
    ),
    StaticDropdownItem(
      title: 'Biology',
      value: 'Biology',
    ),
    StaticDropdownItem(
      title: 'Programming',
      value: 'Programming',
    ),
    StaticDropdownItem(
      title: 'Math',
      value: 'Math',
    ),
    StaticDropdownItem(
      title: 'English',
      value: 'English',
    ),
    StaticDropdownItem(
      title: 'French',
      value: 'French',
    ),
    StaticDropdownItem(
      title: 'Japanese',
      value: 'Japanese',
    ),
    StaticDropdownItem(
      title: 'Others',
      value: 'Others',
    )
  ])
])
class CreateDeckView extends StackedView<CreateDeckViewModel>
    with $CreateDeckView {
  CreateDeckView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  bool submitBtnClicked = false;
  // String dropdownValue = "Others";

  @override
  Widget builder(
    BuildContext context,
    CreateDeckViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(title: "Create Deck"),
      bottomNavigationBar: EMBottomBar(),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: submitBtnClicked
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              const Text(
                'Please fill out the deck name and category',
                style: TextStyle(fontSize: 18),
              ),
              verticalSpaceMedium,
              TextFormField(
                controller: deckNameController,
                decoration: const InputDecoration(
                  labelText: 'Deck Name',
                  border: OutlineInputBorder(),
                ),
                validator: CreateDeckValidators.validateDeckName,
              ),
              verticalSpaceMedium,
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  value: viewModel.currentDropdownValue,
                  onChanged: (String? newValue) {
                    // TODO: find a way to set the valueDD
                    viewModel.changeDropdownValue(newValue);
                  },
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
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList()),
              verticalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  // Implement login functionality here
                  if (_formKey.currentState!.validate()) {
                    viewModel.createNewDeck(deckNameController.text,
                        viewModel.currentDropdownValue);
                  } else {
                    submitBtnClicked = true;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                child: const Text('Create Deck'),
              )
            ],
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
