import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

import 'content_view.desktop.dart';
import 'content_view.tablet.dart';
import 'content_view.mobile.dart';
import 'content_viewmodel.dart';

class ContentView extends StatelessWidget {
  const ContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContentViewModel>.reactive(
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
              mobile: (_) => const ContentViewMobile(),
              tablet: (_) => const ContentViewTablet(),
              desktop: (_) => const ContentViewDesktop(),
            );
          }
        },
        viewModelBuilder: () => ContentViewModel(),
        onViewModelReady: (model) async {});
  }
}
