import 'package:tabletalesweb/app/app.router.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/widgets/components/circular_network_image.dart';

import 'home_viewmodel.dart';

class HomeViewTablet extends ViewModelWidget<HomeViewModel> {
  const HomeViewTablet({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return StackedTabsScaffold(
        backgroundColor: kcWhite,
        routes: [
          DashboardNavigationRoute(),
          QuizNavigationRoute(),
          ProfileNavigationRoute()
        ],
        builder: (context, child, anim) {
          return Column(children: [
            SizedBox(
              height: 75,
              child: AppBar(
                backgroundColor: kcWhite,
                leadingWidth: 190,
                toolbarHeight: 75,
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(),
                ),
                centerTitle: false,
                title: Wrap(children: [
                  TabBar(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                      isScrollable: true,
                      physics: const NeverScrollableScrollPhysics(),
                      dividerHeight: 0,
                      controller: viewModel.tabController,
                      indicatorPadding: EdgeInsets.zero,
                      indicator: const BoxDecoration(color: Colors.transparent),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 24),
                      unselectedLabelColor: kcRegistrationWarningText,
                      labelColor: activeIndicatorColor,
                      padding: EdgeInsets.zero,
                      onTap: (int index) {
                        context.tabsRouter.setActiveIndex(index);
                      },
                      tabs: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: context.tabsRouter.activeIndex == 0
                                  ? activeIndicatorColor
                                  : kcRegistrationWarningText),
                        ),
                        // Text(
                        //   "Messages",
                        //   style: TextStyle(
                        // fontFamily: 'Poppins',
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w500,
                        //       color: context.tabsRouter.activeIndex == 1
                        //           ? activeIndicatorColor
                        //           : kcRegistrationWarningText),
                        // ),
                        Text(
                          "Frequently Asked Questions",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: context.tabsRouter.activeIndex == 1
                                  ? activeIndicatorColor
                                  : kcRegistrationWarningText),
                        )
                      ]),
                ]),
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Divider(
                    height: 1,
                    color: kcHomeViewDivider,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: InkWell(
                      onTap: () {
                        context.tabsRouter.setActiveIndex(2);
                      },
                      child: const CircularNetworkImage(
                        url: "",
                        size: 48,
                        displayName: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(color: kcBackgroundColor, child: child),
            )
          ]);
        });
  }
}
