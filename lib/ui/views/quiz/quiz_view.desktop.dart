import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/views/quick_quiz/quick_quiz_view.dart';

import 'quiz_viewmodel.dart';

class QuizViewDesktop extends ViewModelWidget<QuizViewModel> {
  const QuizViewDesktop({super.key});

  @override
  Widget build(BuildContext context, QuizViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child:
                    SingleChildScrollView(child: _buildLeftPanel(viewModel))),
            Container(
              width: 1,
              decoration: const BoxDecoration(color: kcChatBoxBorder),
            ),
            Expanded(
                flex: 4,
                child: QuickQuizView(
                    key: ValueKey(viewModel.selectedLevel),
                    level: viewModel.selectedLevel)),
          ]),
    );
  }

  Widget _buildLeftPanel(QuizViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: viewModel.tablesByLevel.keys.map((level) {
        final isSelected = level == viewModel.selectedLevel;
        return Material(
          color: isSelected ? kcSettingsMenuBg : kcWhite,
          child: InkWell(
            onTap: () => viewModel.selectLevel(level),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                viewModel.getLevelName(level),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    letterSpacing: 0,
                    color: isSelected ? kcPrimaryColor : kcDarkGreyColor,
                    fontWeight: FontWeight.w600,
                    height: 1.33),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRightPanel(QuizViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: viewModel.selectedTables
            .map((table) => Container(
                  width: 160,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: kcCardBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Table of ${table.table_number}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0,
                        color: kcDarkGreyColor,
                        fontWeight: FontWeight.w500,
                        height: 1.33),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
