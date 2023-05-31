import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
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
                Center(
                  child: Image(image: AssetImage('images/image1.png')),
                ),
                verticalSpaceMedium,
                Center(
                  child: Text(
                    'SIGN UP',
                    style: kcAppBarText2,
                  ),
                ),
                verticalSpaceMedium,
                const Text(
                  'USERNAME',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  focusNode: usernameFocusNode,
                  style: kcNormalTextBlack,
                  controller: usernameController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    hintText: 'Type username...',
                    hintStyle: kcHintText,
                    fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'username',
                  validator: RegisterValidators.validateUsername,
                ),
                verticalSpaceMedium,
                const Text(
                  'EMAIL',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  focusNode: emailFocusNode,
                  style: kcNormalTextBlack,
                  controller: emailController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    hintText: 'Type email...',
                    hintStyle: kcHintText,
                    fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'email',
                  validator: RegisterValidators.validateEmail,
                ),
                verticalSpaceMedium,
                const Text(
                  'PASSWORD',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  focusNode: passwordFocusNode,
                  style: kcNormalTextBlack,
                  controller: passwordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Type password...',
                    hintStyle: kcHintText,
                    fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'password',
                  validator: RegisterValidators.validatePassword,
                ),
                verticalSpaceMedium,
                const Text(
                  'CONFIRM PASSWORD',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  focusNode: confirmPasswordFocusNode,
                  style: kcNormalTextBlack,
                  controller: confirmPasswordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirm password...',
                    hintStyle: kcHintText,
                    fillColor: GFColors.WHITE,

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
                Center(
                  child: GFButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate(
                                focusOnInvalid: false,
                                autoScrollWhenFocusOnInvalid: true) ??
                            false) {
                          viewModel.signUpWithEmail(emailController.text,
                              passwordController.text, usernameController.text);
                        }
                      },
                      color: Colors.amber,
                      text: 'REGISTER',
                      textStyle: kcNormalText2),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'Already have account? ',
                        style: kcNormalText2,
                      ),
                      TextSpan(
                          text: 'Sign in',
                          style: kcNavigateText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.toLogInView();
                            }),
                    ]),
                  ),
                ),
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
