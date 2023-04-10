import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/ui_helpers.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'username',
    // validator: RegisterValidators.validateUsername,
  ),
  FormTextField(
    name: 'email',
    // validator: RegisterValidators.validateEmail,
  ),
  FormTextField(
    name: 'password',
    // validator: RegisterValidators.validatePassword,
  ),
  FormTextField(
    name: 'confirmPassword',
    // validator: RegisterValidators.validateConfirmPassword,
  ),
])

// TODO: add register with google fx
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  bool submitBtnClicked = false;

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: const Text('EzyMemory')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
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
                  'Register',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                verticalSpaceMedium,
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: RegisterValidators.validateUsername,
                ),
                verticalSpaceMedium,
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: RegisterValidators.validateEmail,
                ),
                verticalSpaceMedium,
                TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return RegisterValidators.validatePassword(value);
                    }),
                verticalSpaceMedium,
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return RegisterValidators.validateConfirmPassword(
                        value, passwordController.text);
                  },
                ),
                verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: UserModel related stuff
                      viewModel.signUpWithEmail(emailController.text,
                          passwordController.text, usernameController.text);
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
                  child: const Text('Register'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // syncing the view with viewmodel
  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  // dispose the controllers
  @override
  void onDispose(RegisterViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
