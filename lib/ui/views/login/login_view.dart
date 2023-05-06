import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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

// TODO: add login with google function
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  bool loginBtnClicked = false;

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return EMScaffold(
      appBar: EMAppBar(title: "EzyMemory Login"),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: loginBtnClicked
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                const GFTypography(
                  text: "Login",
                  textColor: GFColors.LIGHT,
                  type: GFTypographyType.typo2,
                  showDivider: false,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: emailController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    labelText: 'Your email',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'email',
                  // validator: CreateDeckValidators.validateDeckName,
                ),
                verticalSpaceMedium,
                FormBuilderTextField(
                  obscureText: true,
                  style: const TextStyle(color: GFColors.WHITE),
                  controller: passwordController,
                  // initialValue: viewModel.isBusy ? "" : viewModel.deckName,
                  decoration: const InputDecoration(
                    labelText: 'Your password',
                    labelStyle: TextStyle(color: GFColors.WHITE),
                    // fillColor: GFColors.WHITE,

                    filled: true,
                    // suffixIcon: _ageHasError
                    //     ? const Icon(Icons.error, color: Colors.red)
                    //     : const Icon(Icons.check, color: Colors.green),
                  ),
                  name: 'password',
                  // validator: CreateDeckValidators.validateDeckName,
                ),
                verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {
                    // Implement login functionality here
                    if (_formKey.currentState!.validate()) {
                      viewModel.logInWithEmail(
                          emailController.text, passwordController.text);
                    } else {
                      loginBtnClicked = true;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement login functionality here
                    viewModel.toRegisterView();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  child: const Text('go to register'),
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
