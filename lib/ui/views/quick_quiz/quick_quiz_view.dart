import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/views/quick_quiz/quick_quiz_view.form.dart';
import 'package:tabletalesweb/ui/widgets/components/custom_text_field.dart';
import 'package:tabletalesweb/ui/widgets/components/floating_text_hint.dart';
import 'package:toastification/toastification.dart';

import 'quick_quiz_viewmodel.dart';

@FormView(autoTextFieldValidation: false, fields: [
  FormTextField(name: 'questionText'),
  FormTextField(name: 'optionA'),
  FormTextField(name: 'optionB'),
  FormTextField(name: 'optionC'),
  FormTextField(name: 'optionD'),
  FormTextField(name: 'correctOption'),
  FormTextField(name: 'correctAnswer')
])
class QuickQuizView extends StackedView<QuickQuizViewModel>
    with $QuickQuizView {
  const QuickQuizView({super.key, this.level});

  final int? level;

  @override
  Widget builder(
    BuildContext context,
    QuickQuizViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Column(children: [
              Expanded(
                child: Center(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      controller: viewModel.controller,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 38.0),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Center(
                                    child: Text(
                                      "Misc Quiz",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0,
                                          fontSize: 24,
                                          color: kcDarkGreyColor,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Question*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                              controller:
                                                  questionTextController,
                                              hint: "2 × 6 = ?",
                                              focusNode: questionTextFocusNode,
                                              errorText: viewModel
                                                  .questionTextValidationMessage,
                                              textInputType: TextInputType.name,
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: DropdownButtonFormField2<String>(
                                        value: viewModel.selectedQuestionType,
                                        isExpanded: true,
                                        iconStyleData: const IconStyleData(
                                          icon: Icon(
                                            Icons.arrow_drop_down_outlined,
                                          ),
                                          iconSize: 24,
                                        ),
                                        dropdownStyleData: DropdownStyleData(
                                          maxHeight: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            color: kcWhite,
                                          ),
                                          scrollbarTheme: ScrollbarThemeData(
                                            radius: const Radius.circular(40),
                                            thickness:
                                                WidgetStateProperty.all(6),
                                            thumbVisibility:
                                                WidgetStateProperty.all(true),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0,
                                            fontSize: 13.0,
                                            color: kcDarkGreyColor,
                                            fontWeight: FontWeight.w500),
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(16.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kcVeryLightGrey,
                                                width: 1.2),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: kcPrimaryColor,
                                                width: 1.2),
                                          ),
                                        ),
                                        onChanged: (item) {
                                          viewModel.selectedQuestionType =
                                              item!;
                                        },
                                        items: viewModel.dropdownQuestionTypes,
                                        selectedItemBuilder: (context) =>
                                            viewModel.dropdownQuestionTypes
                                                .map<Widget>(
                                                  (e) => Text(e.value!),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Option A*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                                controller: optionAController,
                                                hint: "12",
                                                focusNode: optionAFocusNode,
                                                errorText: viewModel
                                                    .optionAValidationMessage,
                                                textInputType:
                                                    TextInputType.text),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Option B*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                              controller: optionBController,
                                              hint: "14",
                                              focusNode: optionBFocusNode,
                                              errorText: viewModel
                                                  .optionBValidationMessage,
                                              textInputType: TextInputType.text,
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Option C*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(children: [
                                              Expanded(
                                                child: Column(children: [
                                                  CustomTexField(
                                                    controller:
                                                        optionCController,
                                                    hint: "16",
                                                    focusNode: optionCFocusNode,
                                                    errorText: viewModel
                                                        .optionCValidationMessage,
                                                    textInputType:
                                                        TextInputType.text,
                                                  ),
                                                ]),
                                              ),
                                            ]),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Option D*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                              controller: optionDController,
                                              hint: "18",
                                              focusNode: optionDFocusNode,
                                              errorText: viewModel
                                                  .correctOptionValidationMessage,
                                              textInputType: TextInputType.text,
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Correct Option*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                              controller:
                                                  correctOptionController,
                                              hint: "A",
                                              focusNode: correctOptionFocusNode,
                                              errorText: viewModel
                                                  .correctOptionValidationMessage,
                                              textInputType: TextInputType.text,
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FloatingTextHint(
                                              text: "Correct Answer*",
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CustomTexField(
                                              controller:
                                                  correctAnswerController,
                                              hint: "12",
                                              focusNode: correctAnswerFocusNode,
                                              errorText: viewModel
                                                  .correctAnswerValidationMessage,
                                              textInputType: TextInputType.text,
                                            ),
                                          ]),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          final index = viewModel
                                              .paginatorController.currentPage;
                                          if (index >=
                                              viewModel.quizzes.length) {
                                            return;
                                          }
                                          viewModel.rebuildQuiz(index);
                                          viewModel
                                              .updateQuiz(
                                                  viewModel.quizzes[index])
                                              .then((value) {
                                            value.fold((l) async {
                                              l.mapOrNull(serverError: (value) {
                                                viewModel.showToast(
                                                    type: ToastificationType
                                                        .error,
                                                    title: value.title,
                                                    description:
                                                        value.description);
                                              });
                                            }, (r) async {
                                              viewModel.showToast(
                                                  type: ToastificationType
                                                      .success,
                                                  title:
                                                      "Quiz updated successfully",
                                                  description:
                                                      "Recheck the quiz once to confirm");
                                            });
                                            viewModel.rebuildUi();
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: kcButtonColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 18.0),
                                            child: Text(
                                              'Submit',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  letterSpacing: 0,
                                                  fontSize: 14,
                                                  color: kcWhite,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                  viewModel.fieldsValidationMessages.isNotEmpty
                                      ? Column(children: [
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Row(children: [
                                            Expanded(
                                              flex: 3,
                                              child: Row(children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                                Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                    child: Text(
                                                      viewModel
                                                          .fieldsValidationMessages
                                                          .values
                                                          .first
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontFamily: 'Poppins',
                                                        letterSpacing: 0,
                                                        fontSize: 12,
                                                        color: Colors.redAccent,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 1,
                                                    child: Container()),
                                              ]),
                                            ),
                                          ]),
                                        ])
                                      : Container(),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _buildNumberPaginator(viewModel),
              const SizedBox(height: 24),
            ]),
            Visibility(
              visible: viewModel.isLoading,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: kcPrimaryColor.withValues(alpha: 0.4),
                child: Center(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: kcWhite,
                    size: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberPaginator(QuickQuizViewModel viewModel) {
    final controller = viewModel.paginatorController;
    final lastPage = viewModel.numberPages - 1;
    return Center(
        child: SizedBox(
      width: 420,
      child: NumberPaginator(
        // by default, the paginator shows numbers as center content
        controller: controller,
        config: const NumberPaginatorUIConfig(
          height: 32,
          buttonPadding: EdgeInsets.zero,
          buttonTextStyle: TextStyle(fontSize: 12),
          buttonSelectedBackgroundColor: kcPrimaryColor,
        ),
        numberPages: viewModel.numberPages,
        onPageChange: (int index) {
          viewModel.showQuiz(index);
        },
        // show/hide the prev/next buttons
        showPrevButton: true,
        showNextButton: true,
        // defaults to true
        // custom content of the prev/next buttons, maintains their behavior
        nextButtonBuilder: (context) => TextButton(
          onPressed: controller.currentPage < lastPage
              ? () => controller.next()
              : null,
          child: const Row(children: [
            Text("Next",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                )),
            Icon(Icons.chevron_right, size: 16),
          ]),
        ),
        // custom prev/next buttons using builder (ignored if showPrevButton/showNextButton is false)
        prevButtonBuilder: (context) => TextButton(
          onPressed:
              controller.currentPage > 0 ? () => controller.prev() : null,
          // _controller must be passed to NumberPaginator
          child: const Row(children: [
            Icon(Icons.chevron_left, size: 16),
            Text("Previous",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                  color: kcDarkGreyColor,
                  fontWeight: FontWeight.w600,
                )),
          ]),
        ),
      ),
    ));
  }

  @override
  QuickQuizViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QuickQuizViewModel();

  @override
  void onViewModelReady(QuickQuizViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.buildDropdownQuestionTypes();
    if (level != null) viewModel.fetchQuizzes(level!);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(QuickQuizViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
