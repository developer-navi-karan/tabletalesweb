import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

import 'quiz_view.desktop.dart';
import 'quiz_view.tablet.dart';
import 'quiz_view.mobile.dart';
import 'quiz_viewmodel.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuizViewModel>.reactive(
        builder: (context, model, child) {
          if (model.isBusy) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: kcPrimaryColor.withValues(alpha: 0.4),
              child: Center(
                child: LoadingAnimationWidget.threeRotatingDots(
                  color: kcWhite,
                  size: 100,
                ),
              ),
            );
          } else if (model.hasError) {
            return Container();
          } else {
            return ScreenTypeLayout.builder(
              mobile: (_) => const QuizViewMobile(),
              tablet: (_) => const QuizViewTablet(),
              desktop: (_) => const QuizViewDesktop(),
            );
          }
        },
        viewModelBuilder: () => QuizViewModel(),
        onViewModelReady: (model) async {});
  }
}
