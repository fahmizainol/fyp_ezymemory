import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/views/edit_deck/edit_deck_viewmodel.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

class EditDeckView extends StackedView<EditDeckViewModel> {
  final String deckId;
  EditDeckView(this.deckId, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
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
          autovalidateMode: AutovalidateMode.always,
          child: viewModel.isBusy
              ? const EMCircular()
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceMedium,
                        const Text(
                          'Please edit the deck name and category',
                          style: kcTitleText,
                        ),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          // enabled: false,
                          style: kcNormalText,
                          // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                          decoration: const InputDecoration(
                            labelText: 'Deck Name:',
                            labelStyle: kcNormalText,
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'deckName',
                          initialValue: viewModel.deckName,
                          onChanged: (val) => viewModel.changeDeckName(val),
                          validator: FormBuilderValidators.required(),
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
                            labelText: 'Category:',
                            labelStyle: kcNormalText,
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
                                    child: Text(
                                      gender,
                                      style: kcNormalText,
                                    ),
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
                        FormBuilderSwitch(
                          initialValue: viewModel.isShared,
                          onChanged: (val) {
                            viewModel.changeIsSharedValue(val);
                          },
                          name: "isShared",
                          // title: Text(
                          //   'Share deck?',
                          //   style: const TextStyle(
                          //     color: GFColors.WHITE,
                          //   ),
                          title: const GFTypography(
                              text: '   Share deck?:',
                              showDivider: false,
                              textColor: GFColors.WHITE,
                              type: GFTypographyType.typo5,
                              fontWeight: FontWeight.normal),
                        ),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          style: kcNormalText,
                          // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                          decoration: const InputDecoration(
                            labelText: 'Deck Count:',
                            labelStyle: TextStyle(color: GFColors.WHITE),
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'deckCount',
                          initialValue: viewModel.deckCount.toString(),
                          enabled: false,
                        ),
                        GFButton(
                          textColor: GFColors.DARK,
                          color: GFColors.LIGHT,
                          onPressed: () async {
                            // Implement login functionality here
                            var res = await viewModel.editDeck(
                                deckId,
                                viewModel.deckName.toString(),
                                viewModel.currentDropdownValue.toString(),
                                viewModel.isShared);

                            // Navigator.of(context).pop();

                            // viewModel.toHomeView();
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
