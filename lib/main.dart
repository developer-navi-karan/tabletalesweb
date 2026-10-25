import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tabletalesweb/app/app.bottomsheets.dart';
import 'package:tabletalesweb/app/app.dialogs.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/app/app.router.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  await Supabase.initialize(
    url: "https://zihvvvbxnpbnokvzkukp.supabase.co",
    publishableKey: "sb_publishable_aHth1T4KXtbGSoODlEZCOg_grUZsSiI",
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
        child: ResponsiveApp(
      builder: (_) => MaterialApp.router(
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: kcPrimaryColor,
            onPrimary: kcWhite,
            secondary: kcPrimaryColor,
            onSecondary: kcWhite,
            error: Colors.red,
            onError: kcBlack,
            background: kcWhite,
            onBackground: kcBlack,
            surface: kcWhite,
            onSurface: kcVeryLightGrey,
          ),
        ),
      ),
    ).animate().fadeIn(
              delay: const Duration(milliseconds: 50),
              duration: const Duration(milliseconds: 400),
            ));
  }
}
