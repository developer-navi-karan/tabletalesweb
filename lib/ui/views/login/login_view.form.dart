// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String EmailAddressInputValueKey = 'emailAddressInput';
const String PasswordInputValueKey = 'passwordInput';

final Map<String, TextEditingController> _LoginViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginViewTextValidations = {
  EmailAddressInputValueKey: null,
  PasswordInputValueKey: null,
};

mixin $LoginView {
  TextEditingController get emailAddressInputController =>
      _getFormTextEditingController(EmailAddressInputValueKey);
  TextEditingController get passwordInputController =>
      _getFormTextEditingController(PasswordInputValueKey);

  FocusNode get emailAddressInputFocusNode =>
      _getFormFocusNode(EmailAddressInputValueKey);
  FocusNode get passwordInputFocusNode =>
      _getFormFocusNode(PasswordInputValueKey);

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
  void syncFormWithViewModel(FormStateHelper model) {
    emailAddressInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    emailAddressInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          EmailAddressInputValueKey: emailAddressInputController.text,
          PasswordInputValueKey: passwordInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
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

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get emailAddressInputValue =>
      this.formValueMap[EmailAddressInputValueKey] as String?;
  String? get passwordInputValue =>
      this.formValueMap[PasswordInputValueKey] as String?;

  set emailAddressInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailAddressInputValueKey: value}),
    );

    if (_LoginViewTextEditingControllers.containsKey(
        EmailAddressInputValueKey)) {
      _LoginViewTextEditingControllers[EmailAddressInputValueKey]?.text =
          value ?? '';
    }
  }

  set passwordInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordInputValueKey: value}),
    );

    if (_LoginViewTextEditingControllers.containsKey(PasswordInputValueKey)) {
      _LoginViewTextEditingControllers[PasswordInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasEmailAddressInput =>
      this.formValueMap.containsKey(EmailAddressInputValueKey) &&
      (emailAddressInputValue?.isNotEmpty ?? false);
  bool get hasPasswordInput =>
      this.formValueMap.containsKey(PasswordInputValueKey) &&
      (passwordInputValue?.isNotEmpty ?? false);

  bool get hasEmailAddressInputValidationMessage =>
      this.fieldsValidationMessages[EmailAddressInputValueKey]?.isNotEmpty ??
      false;
  bool get hasPasswordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey]?.isNotEmpty ?? false;

  String? get emailAddressInputValidationMessage =>
      this.fieldsValidationMessages[EmailAddressInputValueKey];
  String? get passwordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey];
}

extension Methods on FormStateHelper {
  void setEmailAddressInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailAddressInputValueKey] =
          validationMessage;
  void setPasswordInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    emailAddressInputValue = '';
    passwordInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      EmailAddressInputValueKey:
          getValidationMessage(EmailAddressInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoginViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoginViewTextEditingControllers[key]?.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      EmailAddressInputValueKey:
          getValidationMessage(EmailAddressInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
    });
