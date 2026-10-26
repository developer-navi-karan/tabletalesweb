import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/app/app.router.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';
import 'package:tabletalesweb/services/auth_service.dart';
import 'package:tabletalesweb/services/supabase_service.dart';
import 'package:tabletalesweb/ui/common/app_colors.dart';
import 'package:tabletalesweb/ui/views/login/login_view.form.dart';
import 'package:toastification/toastification.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<RouterService>();
  final _authService = locator<AuthService>();
  final _supabaseService = locator<SupabaseService>();
  bool stayLoggedIn = true;
  bool isLoading = false;

  void onSubmit() {
    if (emailAddressInputValue?.isEmpty ?? false) {
      setEmailAddressInputValidationMessage("Enter Email Address");
    } else if (!RegExp(
            r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
        .hasMatch(emailAddressInputValue!)) {
      setEmailAddressInputValidationMessage("Enter Valid Email Address");
    } else if (passwordInputValue?.isEmpty ?? false) {
      setPasswordInputValidationMessage("Enter Password");
    } else if (!RegExp(
            r"""^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$""")
        .hasMatch(passwordInputValue!)) {
      setPasswordInputValidationMessage("Enter Valid Password");
    } else {
      isLoading = true;
    }
    rebuildUi();
  }

  void navigateToHome() {
    if (_supabaseService.supabaseAuth.currentUser?.id ==
        const String.fromEnvironment('ADMIN_UID')) {
      _navigationService.replaceWithHomeView();
      showToast(
          type: ToastificationType.success,
          title: "User logged-in successfully",
          description: "Access content management system.");
    } else {
      showToast(
          type: ToastificationType.info,
          title: 'Missing Admin Privileges',
          description: 'You need admin privileges to login');
    }
  }

  Future<Either<AuthFailure, Unit>> login(
          {required String emailAddress, required String password}) async =>
      _authService.login(emailAddress: emailAddress, password: password);

  Future<void> showToast(
      {required ToastificationType type,
      required String title,
      required String description}) async {
    toastification.show(
      type: type,
      style: ToastificationStyle.flatColored,
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kcPopMenuItem),
      ),
      description: Text(
        description,
        style: const TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: 0,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: kcPopMenuItem),
      ),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
