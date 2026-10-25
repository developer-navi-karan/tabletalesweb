// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/router_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/content_service.dart';
import '../services/dashboard_service.dart';
import '../services/home_service.dart';
import '../services/quiz_service.dart';
import '../services/shared_preferences_service.dart';
import '../services/supabase_service.dart';
import 'app.router.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment,
    EnvironmentFilter? environmentFilter,
    StackedRouterWeb? stackedRouter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => HomeService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => SupabaseService());
  locator.registerLazySingleton(() => DashboardService());
  locator.registerLazySingleton(() => QuizService());
  locator.registerLazySingleton(() => ContentService());
  if (stackedRouter == null) {
    throw Exception(
        'Stacked is building to use the Router (Navigator 2.0) navigation but no stackedRouter is supplied. Pass the stackedRouter to the setupLocator function in main.dart');
  }

  locator<RouterService>().setRouter(stackedRouter);
}
