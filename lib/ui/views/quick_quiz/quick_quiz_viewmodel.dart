import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_country.dart';
import 'package:tabletalesweb/data/model/built_quiz.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';
import 'package:tabletalesweb/services/quiz_service.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/views/quick_quiz/quick_quiz_view.form.dart';
import 'package:toastification/toastification.dart';

class QuickQuizViewModel extends FormViewModel {
  final _quizService = locator<QuizService>();
  List<DropdownMenuItem<String>> dropdownQuestionTypes = [];

  static const _allQuestionTypes = {
    "Multiplication": "multiplication",
    "Missing Number": "missing_number",
    "MCQ": "mcq",
    "True or False": "true_or_false",
    "Fill in the blanks": "fill_in_the_blank",
    "Match": "match",
    "Word Problem": "word_problem"
  };

  String selectedQuestionType = "Multiplication";

  ScrollController controller = ScrollController();

  NumberPaginatorController paginatorController = NumberPaginatorController();

  int numberPages = 1;

  bool isLoading = false;

  Future<Either<AuthFailure, List<BuiltQuiz?>>> getAllQuizzes(
          int level) async =>
      _quizService.getAllQuizzes(level);

  Future<Either<AuthFailure, Unit>> updateQuiz(BuiltQuiz quiz) async =>
      _quizService.updateQuiz(quiz);

  List<BuiltQuiz> quizzes = [];

  Future<void> fetchQuizzes(int level) async {
    isLoading = true;
    rebuildUi();

    final result = await getAllQuizzes(level);
    result.fold((l) {
      l.mapOrNull(serverError: (value) {
        showToast(
            type: ToastificationType.error,
            title: value.title,
            description: value.description);
      });
    }, (r) => quizzes = r.nonNulls.toList());
    // One page per quiz. The paginator keeps the controller it was built
    // with, so keep [paginatorController] and only update the page count;
    // the view is remounted per level, so this starts on the first page.
    numberPages = quizzes.isEmpty ? 1 : quizzes.length;
    isLoading = false;
    showQuiz(0);
  }

  /// Copies the form's values into the quiz at [index] in [quizzes].
  void rebuildQuiz(int index) {
    quizzes[index] = quizzes[index].rebuild((b) => b
      ..question_type = _allQuestionTypes[selectedQuestionType]
      ..question_text = questionTextValue
      ..option_a = optionAValue
      ..option_b = optionBValue
      ..option_c = optionCValue
      ..option_d = optionDValue
      ..correct_option = correctOptionValue
      ..correct_answer = correctAnswerValue);
  }

  /// Fills the form with the quiz at [index] in [quizzes].
  void showQuiz(int index) {
    if (index < quizzes.length) {
      final quiz = quizzes[index];
      questionTextValue = quiz.question_text;
      optionAValue = quiz.option_a;
      optionBValue = quiz.option_b;
      optionCValue = quiz.option_c;
      optionDValue = quiz.option_d;
      correctOptionValue = quiz.correct_option;
      correctAnswerValue = quiz.correct_answer;
      // The dropdown holds display labels; quizzes store the type's value.
      selectedQuestionType = _allQuestionTypes.entries
              .firstWhereOrNull((e) => e.value == quiz.question_type)
              ?.key ??
          selectedQuestionType;
    }
    rebuildUi();
  }

  void buildDropdownQuestionTypes() {
    for (String item in _allQuestionTypes.keys.toList()) {
      dropdownQuestionTypes.add(
        DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
                fontFamily: 'Poppins',
                letterSpacing: 0,
                fontSize: 12.0,
                color: kcDarkGreyColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    rebuildUi();
  }

  Future<void> showToast(
      {required ToastificationType type,
      required String title,
      required String description}) async {
    toastification.show(
      type: type,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kcPopMenuItem),
      ),
      description: Text(
        description,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: kcPopMenuItem),
      ),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
