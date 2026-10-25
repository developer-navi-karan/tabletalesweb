// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter/material.dart' as _i15;
import 'package:stacked/stacked.dart' as _i14;
import 'package:stacked_services/stacked_services.dart' as _i13;

import '../ui/profile_navigation/profile_navigation.dart' as _i8;
import '../ui/views/content/content_view.dart' as _i11;
import '../ui/views/content_navigation/content_navigation.dart' as _i7;
import '../ui/views/dashboard/dashboard_view.dart' as _i9;
import '../ui/views/dashboard_navigation/dashboard_navigation.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/login/login_view.dart' as _i1;
import '../ui/views/profile/profile_view.dart' as _i12;
import '../ui/views/quick_quiz/quick_quiz_view.dart' as _i3;
import '../ui/views/quiz/quiz_view.dart' as _i10;
import '../ui/views/quiz_navigation/quiz_navigation.dart' as _i6;
import '../ui/views/unknown/unknown_view.dart' as _i4;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i13.StackedService.navigatorKey);

class StackedRouterWeb extends _i14.RootStackRouter {
  StackedRouterWeb({_i15.GlobalKey<_i15.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    LoginViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.LoginView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.HomeView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuickQuizViewRoute.name: (routeData) {
      final args = routeData.argsAs<QuickQuizViewArgs>(
          orElse: () => const QuickQuizViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.QuickQuizView(
          key: args.key,
          level: args.level,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      final args = routeData.argsAs<UnknownViewArgs>(
          orElse: () => const UnknownViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.UnknownView(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardNavigationArgs>(
          orElse: () => const DashboardNavigationArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.DashboardNavigation(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuizNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<QuizNavigationArgs>(
          orElse: () => const QuizNavigationArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.QuizNavigation(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContentNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<ContentNavigationArgs>(
          orElse: () => const ContentNavigationArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.ContentNavigation(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileNavigationArgs>(
          orElse: () => const ProfileNavigationArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.ProfileNavigation(key: args.key),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      final args = routeData.argsAs<DashboardViewArgs>(
          orElse: () => const DashboardViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i9.DashboardView(key: args.key),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuizViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<QuizViewArgs>(orElse: () => const QuizViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i10.QuizView(key: args.key),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ContentViewRoute.name: (routeData) {
      final args = routeData.argsAs<ContentViewArgs>(
          orElse: () => const ContentViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i11.ContentView(key: args.key),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileViewRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileViewArgs>(
          orElse: () => const ProfileViewArgs());
      return _i14.CustomPage<dynamic>(
        routeData: routeData,
        child: _i12.ProfileView(key: args.key),
        transitionsBuilder: _i14.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          LoginViewRoute.name,
          path: '/',
        ),
        _i14.RouteConfig(
          HomeViewRoute.name,
          path: '/0',
          children: [
            _i14.RouteConfig(
              DashboardNavigationRoute.name,
              path: 'dashboard-navigation',
              parent: HomeViewRoute.name,
              children: [
                _i14.RouteConfig(
                  DashboardViewRoute.name,
                  path: '',
                  parent: DashboardNavigationRoute.name,
                )
              ],
            ),
            _i14.RouteConfig(
              QuizNavigationRoute.name,
              path: 'quiz-navigation',
              parent: HomeViewRoute.name,
              children: [
                _i14.RouteConfig(
                  QuizViewRoute.name,
                  path: '',
                  parent: QuizNavigationRoute.name,
                )
              ],
            ),
            _i14.RouteConfig(
              ContentNavigationRoute.name,
              path: 'content-navigation',
              parent: HomeViewRoute.name,
              children: [
                _i14.RouteConfig(
                  ContentViewRoute.name,
                  path: '',
                  parent: ContentNavigationRoute.name,
                )
              ],
            ),
            _i14.RouteConfig(
              ProfileNavigationRoute.name,
              path: 'profile-navigation',
              parent: HomeViewRoute.name,
              children: [
                _i14.RouteConfig(
                  ProfileViewRoute.name,
                  path: '',
                  parent: ProfileNavigationRoute.name,
                )
              ],
            ),
          ],
        ),
        _i14.RouteConfig(
          QuickQuizViewRoute.name,
          path: '/quick-quiz-view',
        ),
        _i14.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i14.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginViewRoute extends _i14.PageRouteInfo<LoginViewArgs> {
  LoginViewRoute({_i15.Key? key})
      : super(
          LoginViewRoute.name,
          path: '/',
          args: LoginViewArgs(key: key),
        );

  static const String name = 'LoginView';
}

class LoginViewArgs {
  const LoginViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'LoginViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i14.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HomeViewRoute.name,
          path: '/0',
          args: HomeViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.QuickQuizView]
class QuickQuizViewRoute extends _i14.PageRouteInfo<QuickQuizViewArgs> {
  QuickQuizViewRoute({
    _i15.Key? key,
    int? level,
  }) : super(
          QuickQuizViewRoute.name,
          path: '/quick-quiz-view',
          args: QuickQuizViewArgs(
            key: key,
            level: level,
          ),
        );

  static const String name = 'QuickQuizView';
}

class QuickQuizViewArgs {
  const QuickQuizViewArgs({
    this.key,
    this.level,
  });

  final _i15.Key? key;

  final int? level;

  @override
  String toString() {
    return 'QuickQuizViewArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [_i4.UnknownView]
class UnknownViewRoute extends _i14.PageRouteInfo<UnknownViewArgs> {
  UnknownViewRoute({_i15.Key? key})
      : super(
          UnknownViewRoute.name,
          path: '/404',
          args: UnknownViewArgs(key: key),
        );

  static const String name = 'UnknownView';
}

class UnknownViewArgs {
  const UnknownViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'UnknownViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.DashboardNavigation]
class DashboardNavigationRoute
    extends _i14.PageRouteInfo<DashboardNavigationArgs> {
  DashboardNavigationRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          DashboardNavigationRoute.name,
          path: 'dashboard-navigation',
          args: DashboardNavigationArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardNavigation';
}

class DashboardNavigationArgs {
  const DashboardNavigationArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'DashboardNavigationArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.QuizNavigation]
class QuizNavigationRoute extends _i14.PageRouteInfo<QuizNavigationArgs> {
  QuizNavigationRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          QuizNavigationRoute.name,
          path: 'quiz-navigation',
          args: QuizNavigationArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'QuizNavigation';
}

class QuizNavigationArgs {
  const QuizNavigationArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'QuizNavigationArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ContentNavigation]
class ContentNavigationRoute extends _i14.PageRouteInfo<ContentNavigationArgs> {
  ContentNavigationRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ContentNavigationRoute.name,
          path: 'content-navigation',
          args: ContentNavigationArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ContentNavigation';
}

class ContentNavigationArgs {
  const ContentNavigationArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ContentNavigationArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProfileNavigation]
class ProfileNavigationRoute extends _i14.PageRouteInfo<ProfileNavigationArgs> {
  ProfileNavigationRoute({
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          ProfileNavigationRoute.name,
          path: 'profile-navigation',
          args: ProfileNavigationArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileNavigation';
}

class ProfileNavigationArgs {
  const ProfileNavigationArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ProfileNavigationArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.DashboardView]
class DashboardViewRoute extends _i14.PageRouteInfo<DashboardViewArgs> {
  DashboardViewRoute({_i15.Key? key})
      : super(
          DashboardViewRoute.name,
          path: '',
          args: DashboardViewArgs(key: key),
        );

  static const String name = 'DashboardView';
}

class DashboardViewArgs {
  const DashboardViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'DashboardViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.QuizView]
class QuizViewRoute extends _i14.PageRouteInfo<QuizViewArgs> {
  QuizViewRoute({_i15.Key? key})
      : super(
          QuizViewRoute.name,
          path: '',
          args: QuizViewArgs(key: key),
        );

  static const String name = 'QuizView';
}

class QuizViewArgs {
  const QuizViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'QuizViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.ContentView]
class ContentViewRoute extends _i14.PageRouteInfo<ContentViewArgs> {
  ContentViewRoute({_i15.Key? key})
      : super(
          ContentViewRoute.name,
          path: '',
          args: ContentViewArgs(key: key),
        );

  static const String name = 'ContentView';
}

class ContentViewArgs {
  const ContentViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ContentViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.ProfileView]
class ProfileViewRoute extends _i14.PageRouteInfo<ProfileViewArgs> {
  ProfileViewRoute({_i15.Key? key})
      : super(
          ProfileViewRoute.name,
          path: '',
          args: ProfileViewArgs(key: key),
        );

  static const String name = 'ProfileView';
}

class ProfileViewArgs {
  const ProfileViewArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'ProfileViewArgs{key: $key}';
  }
}

extension RouterStateExtension on _i13.RouterService {
  Future<dynamic> navigateToLoginView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      LoginViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToQuickQuizView({
    _i15.Key? key,
    int? level,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      QuickQuizViewRoute(
        key: key,
        level: level,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      UnknownViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      DashboardNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToQuizNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      QuizNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToContentNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ContentNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToProfileNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProfileNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToNestedDashboardViewInDashboardNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      DashboardViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToNestedQuizViewInQuizNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      QuizViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToNestedContentViewInContentNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ContentViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToNestedProfileViewInProfileNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      ProfileViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      LoginViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithQuickQuizView({
    _i15.Key? key,
    int? level,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      QuickQuizViewRoute(
        key: key,
        level: level,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      UnknownViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      DashboardNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithQuizNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      QuizNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithContentNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ContentNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithProfileNavigation({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProfileNavigationRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithNestedDashboardViewInDashboardNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      DashboardViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithNestedQuizViewInQuizNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      QuizViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithNestedContentViewInContentNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ContentViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithNestedProfileViewInProfileNavigationRouter({
    _i15.Key? key,
    void Function(_i14.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      ProfileViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }
}
