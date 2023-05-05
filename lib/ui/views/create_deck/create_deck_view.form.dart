// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DeckNameValueKey = 'deckName';
const String CategoryValueKey = 'category';

final Map<String, String> CategoryValueToTitleMap = {
  'value': 'title',
  'Science': 'Science',
  'Chemistry': 'Chemistry',
  'Biology': 'Biology',
  'Programming': 'Programming',
  'Math': 'Math',
  'English': 'English',
  'French': 'French',
  'Japanese': 'Japanese',
  'Others': 'Others',
};

final Map<String, TextEditingController> _CreateDeckViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CreateDeckViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CreateDeckViewTextValidations = {
  DeckNameValueKey: null,
};

mixin $CreateDeckView on StatelessWidget {
  TextEditingController get deckNameController =>
      _getFormTextEditingController(DeckNameValueKey);
  FocusNode get deckNameFocusNode => _getFormFocusNode(DeckNameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CreateDeckViewTextEditingControllers.containsKey(key)) {
      return _CreateDeckViewTextEditingControllers[key]!;
    }

    _CreateDeckViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CreateDeckViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CreateDeckViewFocusNodes.containsKey(key)) {
      return _CreateDeckViewFocusNodes[key]!;
    }
    _CreateDeckViewFocusNodes[key] = FocusNode();
    return _CreateDeckViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    deckNameController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    deckNameController.addListener(() => _updateFormData(model));
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
          DeckNameValueKey: deckNameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CreateDeckViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CreateDeckViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CreateDeckViewTextEditingControllers.clear();
    _CreateDeckViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get deckNameValue => this.formValueMap[DeckNameValueKey] as String?;
  String? get categoryValue => this.formValueMap[CategoryValueKey] as String?;

  set deckNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          DeckNameValueKey: value,
        }),
    );

    if (_CreateDeckViewTextEditingControllers.containsKey(DeckNameValueKey)) {
      _CreateDeckViewTextEditingControllers[DeckNameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasDeckName =>
      this.formValueMap.containsKey(DeckNameValueKey) &&
      (deckNameValue?.isNotEmpty ?? false);
  bool get hasCategory => this.formValueMap.containsKey(CategoryValueKey);

  bool get hasDeckNameValidationMessage =>
      this.fieldsValidationMessages[DeckNameValueKey]?.isNotEmpty ?? false;
  bool get hasCategoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey]?.isNotEmpty ?? false;

  String? get deckNameValidationMessage =>
      this.fieldsValidationMessages[DeckNameValueKey];
  String? get categoryValidationMessage =>
      this.fieldsValidationMessages[CategoryValueKey];
}

extension Methods on FormViewModel {
  void setCategory(String category) {
    this.setData(this.formValueMap..addAll({CategoryValueKey: category}));
  }

  setDeckNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DeckNameValueKey] = validationMessage;
  setCategoryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CategoryValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    deckNameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      DeckNameValueKey: getValidationMessage(DeckNameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CreateDeckViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CreateDeckViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      DeckNameValueKey: getValidationMessage(DeckNameValueKey),
    });
