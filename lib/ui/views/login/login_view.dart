import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fyp_ezymemory/ui/common/app_text.dart';
import 'package:fyp_ezymemory/ui/common/ui_helpers.dart';
import 'package:fyp_ezymemory/ui/widgets/em_appbar.dart';
import 'package:fyp_ezymemory/ui/widgets/em_scaffold.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/getwidget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
  ),
  FormTextField(
    name: 'password',
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      // appBar: EMAppBar(title: "EzyMemory Login"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // verticalSpaceLarge,
                verticalSpaceMedium,
                const Center(
                  child: Image(image: AssetImage('images/image1.png')),
                ),
                verticalSpaceLarge,
                const Center(
                  child: Text(
                    'SIGN IN',
                    style: kcAppBarText2,
                  ),
                ),
                verticalSpaceLarge,
                const Text(
                  'EMAIL',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  style: kcNormalTextBlack,
                  controller: emailController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    hintText: 'Your email...',
                    hintStyle: kcHintText,
                    // labelText: 'Your email',
                    // labelStyle: TextStyle(color: GFColors.WHITE),
                    fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'email',
                  validator: LoginValidators.validateEmail,
                ),
                verticalSpaceMedium,
                // Text('data')
                const Text(
                  'PASSWORD',
                  style: kcNormalText2,
                ),
                verticalSpaceTiny,
                FormBuilderTextField(
                  obscureText: true,

                  style: kcNormalTextBlack,
                  controller: passwordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    hintText: 'Your password...',
                    hintStyle: kcHintText,
                    fillColor: Colors.white,
                    // labelText: 'Your password',
                    // labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'password',
                  validator: LoginValidators.validatePassword,
                ),
                verticalSpaceMedium,
                verticalSpaceMedium,
                Center(
                  child: GFButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          viewModel.logInWithEmail(
                              emailController.text, passwordController.text);
                        }
                      },
                      color: Colors.amber,
                      text: 'SIGN IN',
                      textStyle: kcNormalText2),
                ),

                Center(
                  child: GFButton(
                      onPressed: () {
                        viewModel.toRegisterView();
                      },
                      color: Colors.amber,
                      text: 'SIGN IN WITH GOOGLE',
                      textStyle: kcNormalText2),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'No account yet? ',
                        style: kcNormalText2,
                      ),
                      TextSpan(
                          text: 'Sign up',
                          style: kcNavigateText,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              viewModel.toRegisterView();
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
