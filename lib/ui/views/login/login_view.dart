import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'userName',
    validator: LoginValidators.validateReverseText,
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Reverser')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              const Text(
                'Text to Reverse',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              verticalSpaceSmall,
              TextFormField(controller: userNameController),
              if (viewModel.hasUserNameValidationMessage) ...[
                verticalSpaceTiny,
                Text(
                  viewModel.userNameValidationMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
              verticalSpaceMedium,
              Text(
                viewModel.reversedText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // syncing the view with viewmodel
  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  // dispose the controllers
  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  // to rebuild the ui once rebuildUi is called from the viewmodel
  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
