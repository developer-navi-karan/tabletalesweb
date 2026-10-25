import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

import 'dashboard_view.desktop.dart';
import 'dashboard_view.tablet.dart';
import 'dashboard_view.mobile.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
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
              mobile: (_) => const DashboardViewMobile(),
              tablet: (_) => const DashboardViewTablet(),
              desktop: (_) => const DashboardViewDesktop(),
            );
          }
        },
        viewModelBuilder: () => DashboardViewModel(),
        onViewModelReady: (model) async {});
  }
}
