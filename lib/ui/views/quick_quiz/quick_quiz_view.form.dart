// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = false;

const String QuestionTextValueKey = 'questionText';
const String OptionAValueKey = 'optionA';
const String OptionBValueKey = 'optionB';
const String OptionCValueKey = 'optionC';
const String OptionDValueKey = 'optionD';
const String CorrectOptionValueKey = 'correctOption';
const String CorrectAnswerValueKey = 'correctAnswer';

final Map<String, TextEditingController> _QuickQuizViewTextEditingControllers =
    {};

final Map<String, FocusNode> _QuickQuizViewFocusNodes = {};

final Map<String, String? Function(String?)?> _QuickQuizViewTextValidations = {
  QuestionTextValueKey: null,
  OptionAValueKey: null,
  OptionBValueKey: null,
  OptionCValueKey: null,
  OptionDValueKey: null,
  CorrectOptionValueKey: null,
  CorrectAnswerValueKey: null,
};

mixin $QuickQuizView {
  TextEditingController get questionTextController =>
      _getFormTextEditingController(QuestionTextValueKey);
  TextEditingController get optionAController =>
      _getFormTextEditingController(OptionAValueKey);
  TextEditingController get optionBController =>
      _getFormTextEditingController(OptionBValueKey);
  TextEditingController get optionCController =>
      _getFormTextEditingController(OptionCValueKey);
  TextEditingController get optionDController =>
      _getFormTextEditingController(OptionDValueKey);
  TextEditingController get correctOptionController =>
      _getFormTextEditingController(CorrectOptionValueKey);
  TextEditingController get correctAnswerController =>
      _getFormTextEditingController(CorrectAnswerValueKey);

  FocusNode get questionTextFocusNode =>
      _getFormFocusNode(QuestionTextValueKey);
  FocusNode get optionAFocusNode => _getFormFocusNode(OptionAValueKey);
  FocusNode get optionBFocusNode => _getFormFocusNode(OptionBValueKey);
  FocusNode get optionCFocusNode => _getFormFocusNode(OptionCValueKey);
  FocusNode get optionDFocusNode => _getFormFocusNode(OptionDValueKey);
  FocusNode get correctOptionFocusNode =>
      _getFormFocusNode(CorrectOptionValueKey);
  FocusNode get correctAnswerFocusNode =>
      _getFormFocusNode(CorrectAnswerValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_QuickQuizViewTextEditingControllers.containsKey(key)) {
      return _QuickQuizViewTextEditingControllers[key]!;
    }

    _QuickQuizViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _QuickQuizViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_QuickQuizViewFocusNodes.containsKey(key)) {
      return _QuickQuizViewFocusNodes[key]!;
    }
    _QuickQuizViewFocusNodes[key] = FocusNode();
    return _QuickQuizViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    questionTextController.addListener(() => _updateFormData(model));
    optionAController.addListener(() => _updateFormData(model));
    optionBController.addListener(() => _updateFormData(model));
    optionCController.addListener(() => _updateFormData(model));
    optionDController.addListener(() => _updateFormData(model));
    correctOptionController.addListener(() => _updateFormData(model));
    correctAnswerController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    questionTextController.addListener(() => _updateFormData(model));
    optionAController.addListener(() => _updateFormData(model));
    optionBController.addListener(() => _updateFormData(model));
    optionCController.addListener(() => _updateFormData(model));
    optionDController.addListener(() => _updateFormData(model));
    correctOptionController.addListener(() => _updateFormData(model));
    correctAnswerController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          QuestionTextValueKey: questionTextController.text,
          OptionAValueKey: optionAController.text,
          OptionBValueKey: optionBController.text,
          OptionCValueKey: optionCController.text,
          OptionDValueKey: optionDController.text,
          CorrectOptionValueKey: correctOptionController.text,
          CorrectAnswerValueKey: correctAnswerController.text,
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

    for (var controller in _QuickQuizViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _QuickQuizViewFocusNodes.values) {
      focusNode.dispose();
    }

    _QuickQuizViewTextEditingControllers.clear();
    _QuickQuizViewFocusNodes.clear();
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

  String? get questionTextValue =>
      this.formValueMap[QuestionTextValueKey] as String?;
  String? get optionAValue => this.formValueMap[OptionAValueKey] as String?;
  String? get optionBValue => this.formValueMap[OptionBValueKey] as String?;
  String? get optionCValue => this.formValueMap[OptionCValueKey] as String?;
  String? get optionDValue => this.formValueMap[OptionDValueKey] as String?;
  String? get correctOptionValue =>
      this.formValueMap[CorrectOptionValueKey] as String?;
  String? get correctAnswerValue =>
      this.formValueMap[CorrectAnswerValueKey] as String?;

  set questionTextValue(String? value) {
    this.setData(
      this.formValueMap..addAll({QuestionTextValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(
        QuestionTextValueKey)) {
      _QuickQuizViewTextEditingControllers[QuestionTextValueKey]?.text =
          value ?? '';
    }
  }

  set optionAValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OptionAValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(OptionAValueKey)) {
      _QuickQuizViewTextEditingControllers[OptionAValueKey]?.text = value ?? '';
    }
  }

  set optionBValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OptionBValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(OptionBValueKey)) {
      _QuickQuizViewTextEditingControllers[OptionBValueKey]?.text = value ?? '';
    }
  }

  set optionCValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OptionCValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(OptionCValueKey)) {
      _QuickQuizViewTextEditingControllers[OptionCValueKey]?.text = value ?? '';
    }
  }

  set optionDValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OptionDValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(OptionDValueKey)) {
      _QuickQuizViewTextEditingControllers[OptionDValueKey]?.text = value ?? '';
    }
  }

  set correctOptionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CorrectOptionValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(
        CorrectOptionValueKey)) {
      _QuickQuizViewTextEditingControllers[CorrectOptionValueKey]?.text =
          value ?? '';
    }
  }

  set correctAnswerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CorrectAnswerValueKey: value}),
    );

    if (_QuickQuizViewTextEditingControllers.containsKey(
        CorrectAnswerValueKey)) {
      _QuickQuizViewTextEditingControllers[CorrectAnswerValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasQuestionText =>
      this.formValueMap.containsKey(QuestionTextValueKey) &&
      (questionTextValue?.isNotEmpty ?? false);
  bool get hasOptionA =>
      this.formValueMap.containsKey(OptionAValueKey) &&
      (optionAValue?.isNotEmpty ?? false);
  bool get hasOptionB =>
      this.formValueMap.containsKey(OptionBValueKey) &&
      (optionBValue?.isNotEmpty ?? false);
  bool get hasOptionC =>
      this.formValueMap.containsKey(OptionCValueKey) &&
      (optionCValue?.isNotEmpty ?? false);
  bool get hasOptionD =>
      this.formValueMap.containsKey(OptionDValueKey) &&
      (optionDValue?.isNotEmpty ?? false);
  bool get hasCorrectOption =>
      this.formValueMap.containsKey(CorrectOptionValueKey) &&
      (correctOptionValue?.isNotEmpty ?? false);
  bool get hasCorrectAnswer =>
      this.formValueMap.containsKey(CorrectAnswerValueKey) &&
      (correctAnswerValue?.isNotEmpty ?? false);

  bool get hasQuestionTextValidationMessage =>
      this.fieldsValidationMessages[QuestionTextValueKey]?.isNotEmpty ?? false;
  bool get hasOptionAValidationMessage =>
      this.fieldsValidationMessages[OptionAValueKey]?.isNotEmpty ?? false;
  bool get hasOptionBValidationMessage =>
      this.fieldsValidationMessages[OptionBValueKey]?.isNotEmpty ?? false;
  bool get hasOptionCValidationMessage =>
      this.fieldsValidationMessages[OptionCValueKey]?.isNotEmpty ?? false;
  bool get hasOptionDValidationMessage =>
      this.fieldsValidationMessages[OptionDValueKey]?.isNotEmpty ?? false;
  bool get hasCorrectOptionValidationMessage =>
      this.fieldsValidationMessages[CorrectOptionValueKey]?.isNotEmpty ?? false;
  bool get hasCorrectAnswerValidationMessage =>
      this.fieldsValidationMessages[CorrectAnswerValueKey]?.isNotEmpty ?? false;

  String? get questionTextValidationMessage =>
      this.fieldsValidationMessages[QuestionTextValueKey];
  String? get optionAValidationMessage =>
      this.fieldsValidationMessages[OptionAValueKey];
  String? get optionBValidationMessage =>
      this.fieldsValidationMessages[OptionBValueKey];
  String? get optionCValidationMessage =>
      this.fieldsValidationMessages[OptionCValueKey];
  String? get optionDValidationMessage =>
      this.fieldsValidationMessages[OptionDValueKey];
  String? get correctOptionValidationMessage =>
      this.fieldsValidationMessages[CorrectOptionValueKey];
  String? get correctAnswerValidationMessage =>
      this.fieldsValidationMessages[CorrectAnswerValueKey];
}

extension Methods on FormStateHelper {
  void setQuestionTextValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QuestionTextValueKey] = validationMessage;
  void setOptionAValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OptionAValueKey] = validationMessage;
  void setOptionBValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OptionBValueKey] = validationMessage;
  void setOptionCValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OptionCValueKey] = validationMessage;
  void setOptionDValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OptionDValueKey] = validationMessage;
  void setCorrectOptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CorrectOptionValueKey] = validationMessage;
  void setCorrectAnswerValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CorrectAnswerValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    questionTextValue = '';
    optionAValue = '';
    optionBValue = '';
    optionCValue = '';
    optionDValue = '';
    correctOptionValue = '';
    correctAnswerValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      QuestionTextValueKey: getValidationMessage(QuestionTextValueKey),
      OptionAValueKey: getValidationMessage(OptionAValueKey),
      OptionBValueKey: getValidationMessage(OptionBValueKey),
      OptionCValueKey: getValidationMessage(OptionCValueKey),
      OptionDValueKey: getValidationMessage(OptionDValueKey),
      CorrectOptionValueKey: getValidationMessage(CorrectOptionValueKey),
      CorrectAnswerValueKey: getValidationMessage(CorrectAnswerValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _QuickQuizViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _QuickQuizViewTextEditingControllers[key]?.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      QuestionTextValueKey: getValidationMessage(QuestionTextValueKey),
      OptionAValueKey: getValidationMessage(OptionAValueKey),
      OptionBValueKey: getValidationMessage(OptionBValueKey),
      OptionCValueKey: getValidationMessage(OptionCValueKey),
      OptionDValueKey: getValidationMessage(OptionDValueKey),
      CorrectOptionValueKey: getValidationMessage(CorrectOptionValueKey),
      CorrectAnswerValueKey: getValidationMessage(CorrectAnswerValueKey),
    });
