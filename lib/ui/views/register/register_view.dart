import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/views/register/register_view.form.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/getwidget.dart';
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
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(title: 'EzyMemory register'),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                const GFTypography(
                  text: "Register",
                  textColor: GFColors.LIGHT,
                  type: GFTypographyType.typo2,
                  showDivider: false,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  focusNode: usernameFocusNode,
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: usernameController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'username',
                  validator: RegisterValidators.validateUsername,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  focusNode: emailFocusNode,
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: emailController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'email',
                  validator: RegisterValidators.validateEmail,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  focusNode: passwordFocusNode,
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: passwordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'password',
                  validator: RegisterValidators.validatePassword,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  focusNode: confirmPasswordFocusNode,
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: confirmPasswordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'confirmPassword',
                  validator: (value) =>
                      RegisterValidators.validateConfirmPassword(
                          value, passwordController.text),
                ),
                verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate(
                            focusOnInvalid: false,
                            autoScrollWhenFocusOnInvalid: true) ??
                        false) {
                      viewModel.signUpWithEmail(emailController.text,
                          passwordController.text, usernameController.text);
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
