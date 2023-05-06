import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/views/create_deck/create_deck_view.form.dart';
import 'package:fyp_ezymemory/ui/views/edit_deck/edit_deck_viewmodel.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'edit_deck_viewmodel.dart';

class EditDeckView extends StackedView<EditDeckViewModel> {
  final String deckId;
  EditDeckView(this.deckId, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  bool submitBtnClicked = false;
  // String dropdownValue = "Others";

  @override
  Widget builder(
    BuildContext context,
    EditDeckViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: "Edit Deck"),
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
                            text: "Please edit the deck name and category",
                            textColor: GFColors.WHITE,
                            showDivider: false),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          style: const TextStyle(color: GFColors.WHITE),
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
                          initialValue: viewModel.deckName,
                          onChanged: (val) => viewModel.changeDeckName(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),
                        verticalSpaceMedium,
                        FormBuilderDropdown<String>(
                          // alignment: Alignment.bottomRight,
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
                                    // alignment: Alignment.bottomLeft,
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            viewModel.changeDropdownValue(val);
                            // setState(() {
                            //   _genderHasError =
                            //       !(_formKey.currentState?.fields['gender']?.validate() ??
                            //           false);
                            // });
                          },
                          valueTransformer: (val) => val?.toString(),
                        ),
                        verticalSpaceMedium,
                        GFButton(
                          textColor: GFColors.DARK,
                          color: GFColors.LIGHT,
                          onPressed: () async {
                            // Implement login functionality here
                            var res = await viewModel.editDeck(
                                deckId,
                                viewModel.deckName.toString(),
                                viewModel.currentDropdownValue.toString());
                            // if (res) {
                            //   GFToast.showToast('Edit Deck Success!', context,
                            //       toastPosition: GFToastPosition.BOTTOM,
                            //       textStyle: const TextStyle(
                            //           fontSize: 16, color: GFColors.DARK),
                            //       backgroundColor: GFColors.LIGHT,
                            //       trailing: const Icon(
                            //         Icons.notifications,
                            //         color: GFColors.SUCCESS,
                            //       ));
                            // }
                          },
                          child: const Text('Update Deck'),
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
  EditDeckViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EditDeckViewModel(deckId: deckId);
}
