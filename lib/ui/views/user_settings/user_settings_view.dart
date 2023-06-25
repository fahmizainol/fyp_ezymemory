import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/em_appbar.dart';
import '../../widgets/em_bottombar/em_bottombar.dart';
import '../../widgets/em_circular.dart';
import '../../widgets/em_scaffold.dart';
import 'user_settings_viewmodel.dart';

class UserSettingsView extends StackedView<UserSettingsViewModel> {
  UserSettingsView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  bool submitBtnClicked = false;

  @override
  Widget builder(
    BuildContext context,
    UserSettingsViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: const EMAppBar(title: "Set Reminder"),
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
                        const Text(
                          'Please configure the time you want to be reminded for lesson',
                          style: kcTitleText,
                        ),
                        verticalSpaceMedium,
                        const Text(
                          'You will be reminded everyday at the time you have chosen',
                          style: kcNormalText,
                        ),
                        verticalSpaceMedium,
                        // FormBuilderDateTimePicker(name: 'name', initialValue: ,),
                        FormBuilderDateTimePicker(
                          style: kcNormalText,
                          name: 'name',
                          inputType: InputType.time,
                          decoration: const InputDecoration(
                            labelText: 'Lesson Time',
                            labelStyle: kcNormalText,
                            // fillColor: GFColors.WHITE,

                            filled: true,
                            // suffixIcon: _ageHasError
                            //     ? const Icon(Icons.error, color: Colors.red)
                            //     : const Icon(Icons.check, color: Colors.green),
                          ),
                          initialValue: viewModel.reminderTime,
                          onChanged: (val) => viewModel.changeReminderTime(val),
                          // validator: CreateDeckValidators.validateDeckName,
                        ),

                        verticalSpaceMedium,
                        GFButton(
                          textColor: GFColors.DARK,
                          color: GFColors.LIGHT,
                          onPressed: () {
                            // Implement login functionality here
                            // var res = await viewModel.editDeck(
                            //     deckId,
                            //     viewModel.deckName.toString(),
                            //     viewModel.currentDropdownValue.toString(),
                            //     viewModel.isShared);
                            viewModel.updateReminder();
                          },
                          child: const Text('Update Reminder Time'),
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
  UserSettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserSettingsViewModel();
}
