import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_bottombar/em_bottombar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_circular.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import 'admin_edit_badge_viewmodel.dart';

class AdminEditBadgeView extends StackedView<AdminEditBadgeViewModel> {
  final String badgeId;
  AdminEditBadgeView(this.badgeId, {Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget builder(
    BuildContext context,
    AdminEditBadgeViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: "Create Badge"),
      bottomNavigationBar: const EMBottomBar(),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          // autovalidateMode: submitBtnClicked
          //     ? AutovalidateMode.onUserInteraction
          //     : AutovalidateMode.disabled,
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
                          'Please fill the form fields',
                          style: kcTitleText,
                        ),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          // enabled: false,
                          style: kcNormalText,
                          initialValue: viewModel.name,
                          decoration: const InputDecoration(
                            labelText: 'Badge Name:',
                            labelStyle: kcNormalText,
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'badgeName',
                          onChanged: (val) => viewModel.changeNameValue(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),
                        verticalSpaceMedium,
                        FormBuilderTextField(
                          maxLines: 3,
                          // enabled: false,
                          style: kcNormalText,
                          initialValue: viewModel.description,
                          decoration: const InputDecoration(
                            labelText: 'Description:',
                            labelStyle: kcNormalText,
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          name: 'description',
                          onChanged: (val) =>
                              viewModel.changeDescriptionValue(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),
                        verticalSpaceMedium,
                        FormBuilderImagePicker(
                            name: 'image',
                            decoration: const InputDecoration(
                                labelText: 'Badge Logo',
                                labelStyle: kcNormalText,
                                filled: true),
                            maxImages: 1,
                            onChanged: (value) {
                              for (var element in value!) {
                                // print(element);
                                viewModel.changeImageValue(element);
                              }
                              // viewModel.changeImageValue(value);
                              // print(value);
                            },
                            initialValue: [
                              viewModel.badgeImg
                            ],
                            // onSaved: ,
                            availableImageSources: const [
                              ImageSourceOption.gallery
                            ]),
                        verticalSpaceMedium,
                        GFButton(
                          textColor: GFColors.DARK,
                          color: GFColors.LIGHT,
                          onPressed: () async {
                            // Implement login functionality here

                            // Navigator.of(context).pop();
                            viewModel.editBadge(
                              badgeId,
                              viewModel.name.toString(),
                              viewModel.description.toString(),
                            );

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
                          child: const Text('Update Badge'),
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
  AdminEditBadgeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AdminEditBadgeViewModel(badgeId: badgeId);
}
