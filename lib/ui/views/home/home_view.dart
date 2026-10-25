import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';

import 'home_view.desktop.dart';
import 'home_view.tablet.dart';
import 'home_view.mobile.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
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
              mobile: (_) => const HomeViewMobile(),
              tablet: (_) => const HomeViewTablet(),
              desktop: (_) => const HomeViewDesktop(),
            );
          }
        },
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (viewModel) async {
          viewModel.tabController = TabController(length: 3, vsync: this);
        });
  }
}
