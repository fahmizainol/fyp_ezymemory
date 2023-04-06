// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/views/login/login_viewmodel.dart';
import 'package:stacked/stacked.dart';

const String UserNameValueKey = 'userName';

final Map<String, TextEditingController> _LoginViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginViewTextValidations = {
  UserNameValueKey: LoginValidators.validateReverseText,
};

mixin $LoginView on StatelessWidget {
  TextEditingController get userNameController =>
      _getFormTextEditingController(UserNameValueKey);
  FocusNode get userNameFocusNode => _getFormFocusNode(UserNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LoginViewTextEditingControllers.containsKey(key)) {
      return _LoginViewTextEditingControllers[key]!;
    }

    _LoginViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoginViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoginViewFocusNodes.containsKey(key)) {
      return _LoginViewFocusNodes[key]!;
    }
    _LoginViewFocusNodes[key] = FocusNode();
    return _LoginViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    userNameController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    userNameController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UserNameValueKey: userNameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LoginViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoginViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LoginViewTextEditingControllers.clear();
    _LoginViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get userNameValue => this.formValueMap[UserNameValueKey] as String?;

  set userNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          UserNameValueKey: value,
        }),
    );

    if (_LoginViewTextEditingControllers.containsKey(UserNameValueKey)) {
      _LoginViewTextEditingControllers[UserNameValueKey]?.text = value ?? '';
    }
  }

  bool get hasUserName =>
      this.formValueMap.containsKey(UserNameValueKey) &&
      (userNameValue?.isNotEmpty ?? false);

  bool get hasUserNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey]?.isNotEmpty ?? false;

  String? get userNameValidationMessage =>
      this.fieldsValidationMessages[UserNameValueKey];
}

extension Methods on FormViewModel {
  setUserNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UserNameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    userNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoginViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoginViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      UserNameValueKey: getValidationMessage(UserNameValueKey),
    });
