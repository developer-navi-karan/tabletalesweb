import 'package:stacked/stacked.dart';
import 'package:tabletalesweb/services/auth_service.dart';
import 'package:tabletalesweb/services/supabase_service.dart';
import 'package:tabletalesweb/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tabletalesweb/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tabletalesweb/ui/profile_navigation/profile_navigation.dart';
import 'package:tabletalesweb/ui/views/content_navigation/content_navigation.dart';
import 'package:tabletalesweb/ui/views/dashboard_navigation/dashboard_navigation.dart';
import 'package:tabletalesweb/ui/views/home/home_view.dart';
import 'package:tabletalesweb/ui/views/quiz_navigation/quiz_navigation.dart';
import 'package:tabletalesweb/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tabletalesweb/ui/views/dashboard/dashboard_view.dart';
import 'package:tabletalesweb/ui/views/quiz/quiz_view.dart';
import 'package:tabletalesweb/ui/views/content/content_view.dart';
import 'package:tabletalesweb/ui/views/profile/profile_view.dart';
import 'package:tabletalesweb/services/home_service.dart';
import 'package:tabletalesweb/services/shared_preferences_service.dart';
import 'package:tabletalesweb/ui/views/login/login_view.dart';
import 'package:tabletalesweb/services/dashboard_service.dart';
import 'package:tabletalesweb/services/quiz_service.dart';
import 'package:tabletalesweb/services/content_service.dart';
import 'package:tabletalesweb/ui/views/quick_quiz/quick_quiz_view.dart';

// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: LoginView, initial: true),
    CustomRoute(page: HomeView, path: '/0', children: [
      CustomRoute(page: DashboardNavigation, children: [
        CustomRoute(
          page: DashboardView,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ]),
      CustomRoute(page: QuizNavigation, children: [
        CustomRoute(
          page: QuizView,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ]),
      CustomRoute(page: ContentNavigation, children: [
        CustomRoute(
          page: ContentView,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ]),
      CustomRoute(page: ProfileNavigation, children: [
        CustomRoute(
          page: ProfileView,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ]),
    ]),
    CustomRoute(page: QuickQuizView),
// @stacked-route
    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: HomeService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: SupabaseService),
    LazySingleton(classType: DashboardService),
    LazySingleton(classType: QuizService),
    LazySingleton(classType: ContentService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
