import 'package:tabletalesweb/app/app.router.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/common/app_constants.dart';
import 'package:tabletalesweb/ui/common/app_strings.dart';
import 'package:tabletalesweb/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/ui/widgets/components/mobile_navigation_rail_icon_widget.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return StackedTabsScaffold(
      backgroundColor: kcWhite,
      routes: [
        DashboardNavigationRoute(),
        QuizNavigationRoute(),
        ContentNavigationRoute(),
        ProfileNavigationRoute(),
      ],
      appBarBuilder: (context, tabRouter) => PreferredSize(
        preferredSize: const Size.fromHeight(kdDesktopToolbarHeight),
        child: Column(
          children: [
            AppBar(
                backgroundColor: kcWhite,
                surfaceTintColor: Colors.transparent,
                elevation: 5,
                centerTitle: true,
                title: Text(
                  homeMenuHeader[context.tabsRouter.activeIndex],
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: kcDarkGreyColor),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                        onTap: () async {},
                        child: const Image(
                          image: AssetImage('assets/icons/faq.png'),
                        )),
                  ),
                ]),
            Container(
              height: 4,
              color: kcWhite,
            )
          ],
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) => NavigationBar(
        selectedIndex: tabsRouter.activeIndex,
        onDestinationSelected: tabsRouter.setActiveIndex,
        backgroundColor: kcWhite,
        indicatorColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            icon: MobileNavigationRailIconWidget(
              itemName: homeMenu[0],
              itemIcon: homeMenuIcon[0],
              color: kcHomeMenu,
            ),
            selectedIcon: MobileNavigationRailIconWidget(
              itemName: homeMenu[0],
              itemIcon: homeMenuIcon[0],
              color: kcPrimaryColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: MobileNavigationRailIconWidget(
              itemName: homeMenu[1],
              itemIcon: homeMenuIcon[1],
              color: kcHomeMenu,
            ),
            selectedIcon: MobileNavigationRailIconWidget(
              itemName: homeMenu[1],
              itemIcon: homeMenuIcon[1],
              color: kcPrimaryColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: MobileNavigationRailIconWidget(
              itemName: homeMenu[2],
              itemIcon: homeMenuIcon[2],
              color: kcHomeMenu,
            ),
            selectedIcon: MobileNavigationRailIconWidget(
              itemName: homeMenu[2],
              itemIcon: homeMenuIcon[2],
              color: kcPrimaryColor,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: MobileNavigationRailIconWidget(
              itemName: homeMenu[3],
              itemIcon: homeMenuIcon[3],
              color: kcHomeMenu,
            ),
            selectedIcon: MobileNavigationRailIconWidget(
              itemName: homeMenu[3],
              itemIcon: homeMenuIcon[3],
              color: kcPrimaryColor,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
