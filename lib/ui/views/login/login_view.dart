import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: LoginValidators.validateReverseText,
  ),
  FormTextField(
    name: 'password',
    validator: LoginValidators.validateReverseText,
  ),
])

// TODO: add login with google function
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
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              verticalSpaceMedium,
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              // if (viewModel.hasemailValidationMessage) ...[
              //   verticalSpaceTiny,
              //   Text(
              //     viewModel.emailValidationMessage!,
              //     style: const TextStyle(
              //       color: Colors.red,
              //       fontSize: 12,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ],
              verticalSpaceMedium,
              // Text(
              //   viewModel.reversedText,
              //   style: const TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              verticalSpaceMedium,
              ElevatedButton(
                onPressed: () {
                  // Implement login functionality here
                  viewModel.logInWithEmail(
                      emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                child: const Text('Login'),
              )
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
