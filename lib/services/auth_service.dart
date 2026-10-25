import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tabletalesweb/app/app.locator.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/services/auth_service_interface.dart';
import 'package:tabletalesweb/services/supabase_service.dart';

import '../domain/auth/auth_failure.dart';

class AuthService extends AuthServiceInterface {
  final _supabaseService = locator<SupabaseService>();

  @override
  Future<Either<AuthFailure, Unit>> confirmPasswordReset(
      String oobCode, String password) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, String>> getOtp(String id) {
    // TODO: implement getOtp
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, BuiltUser>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> login(
      {required String emailAddress, required String password}) async {
    try {
      await _supabaseService.supabaseAuth
          .signInWithPassword(email: emailAddress, password: password);
      return right(unit);
    } on AuthException catch (e) {
      return friendlyAuthError(e);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuiltUser builtUser}) async {
    try {
      final Map<String, dynamic> data = jsonDecode(builtUser.toJson());
      await _supabaseService.supabaseAuth
          .signUp(email: emailAddress, password: password, data: data);
      return right(unit);
    } on AuthException catch (e) {
      return friendlyAuthError(e);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> checkEmailExists(
      {required String emailAddress}) async {
    try {
      final result = await _supabaseService.supabaseClient.rpc(
        'check_email_exists',
        params: {
          'p_email': emailAddress,
        },
      );

      if (result == false) {
        return left(const AuthFailure.userNotFound(
            title: 'User Not Found',
            description:
                'The user ID provided does not match any existing records.'));
      }
      return right(unit);
    } on PostgrestException catch (e) {
      return left(
          const AuthFailure.serverError(title: 'Error', description: 'error'));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> checkPhoneExists(
      {required String phoneNumber}) async {
    final result = await _supabaseService.supabaseClient.rpc(
      'check_phone_exists',
      params: {
        'phone_number': phoneNumber,
      },
    );

    if (result == true) {
      return left(const AuthFailure.mobileNumberInUse(
          title: 'Number already exists',
          description: 'Please register with a different number.'));
    }
    return right(unit);
  }

  @override
  Future<Either<AuthFailure, Unit>> verify(
      {required String email, required String code}) async {
    try {
      await _supabaseService.supabaseAuth.verifyOTP(
          email: email.trim().toLowerCase(), token: code, type: OtpType.email);
      await _supabaseService.supabaseAuth.refreshSession();
      return right(unit);
    } on AuthException catch (e) {
      return friendlyAuthError(e);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> isUserSubscribed(
      {required String userId}) async {
    try {
      final row = await _supabaseService.supabaseDb
          .from('user_subscription')
          .select('user_id')
          .eq('user_id', userId)
          .limit(1)
          .maybeSingle();

      return row != null
          ? right(unit)
          : left(const AuthFailure.userNotSubscribed(
              title: "User not subscribed",
              description:
                  "Access all levels and multiple quizzes on subscription"));
    } on PostgrestException catch (e) {
      return left(const AuthFailure.serverError(
          title: 'Oh Snap!',
          description: 'Something went wrong. Please try again.'));
    }
  }

  @override
  Future<void> sendResetCode(String email) async {
    await _supabaseService.supabaseAuth.resetPasswordForEmail(email.trim());
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyResetCode(
      String email, String code) async {
    try {
      final res = await _supabaseService.supabaseAuth.verifyOTP(
        email: email.trim(),
        token: code.trim(),
        type: OtpType.recovery,
      );
      if (res.session != null) return right(unit);
      return left(const AuthFailure.sessionExpired(
          title: 'Recovery session expired',
          description: 'Something went wrong. Please try again.'));
    } on AuthException catch (e) {
      return friendlyAuthError(e);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> setNewPassword(String newPassword) async {
    try {
      await _supabaseService.supabaseAuth
          .updateUser(UserAttributes(password: newPassword));
      await _supabaseService.supabaseAuth.signOut();
      return right(unit);
    } on AuthException catch (e) {
      return friendlyAuthError(e);
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateAuthUser(
      {required BuiltUser builtUser}) {
    // TODO: implement updateAuthUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> updateUser(
      {required BuiltUser builtUser}) async {
    final user = _supabaseService.supabaseAuth.currentUser;
    if (user == null) {
      try {
        final Map<String, dynamic> data = jsonDecode(builtUser.toJson());
        await _supabaseService.supabaseClient.from('users').upsert(data);
        return right(unit);
      } on PostgrestException catch (e) {
        return left(const AuthFailure.serverError(
            title: 'Oh Snap!',
            description: 'Something went wrong. Please try again.'));
      }
    }
    return left(const AuthFailure.serverError(
        title: 'Oh Snap!',
        description: 'Something went wrong. Please try again.'));
  }

  @override
  Future<Either<AuthFailure, Unit>> verifyPasswordResetCode(String oobCode) {
    // TODO: implement verifyPasswordResetCode
    throw UnimplementedError();
  }

  Either<AuthFailure, Unit> friendlyAuthError(AuthException e) {
    switch (e.code) {
      case 'email_exists':
      case 'user_already_exists':
        return left(const AuthFailure.emailAlreadyInUse(
            title: 'User already exists',
            description: 'Please register with a different mail.'));
      case 'phone_exists':
        return left(const AuthFailure.mobileNumberInUse(
            title: 'Mobile already exists',
            description: 'Please register with a different number.'));
      case 'email_address_invalid':
      case 'validation_failed':
        return left(const AuthFailure.invalidInput(
            title: 'Email address invalid',
            description: 'Please enter a valid email address.'));
      case 'otp_expired':
        return left(const AuthFailure.otpExpired(
            title: 'Otp expired',
            description: 'Please request a new code and try again.'));
      case 'over_email_send_rate_limit':
      case 'over_sms_send_rate_limit':
      case 'over_request_rate_limit':
        return left(const AuthFailure.tooManyRequests(
            title: 'Too many requests',
            description:
                'Please come back to complete the registration process after sometime.'));
      case 'session_not_found':
      case 'session_expired':
        return left(const AuthFailure.sessionExpired(
            title: 'Session expired',
            description: 'Please log in again to continue.'));
      case 'invalid_credentials':
        return left(const AuthFailure.invalidCredentials(
            title: 'Invalid credentials',
            description: 'Please check your email and password.'));
      case 'email_not_confirmed':
        return left(const AuthFailure.emailNotConfirmed(
            title: 'Email not confirmed',
            description: 'Please confirm your email address to continue.'));
      case 'user_banned':
        return left(const AuthFailure.userBanned(
            title: 'This account has been suspended',
            description: 'Please contact support for help.'));
      default:
        return left(const AuthFailure.serverError(
            title: 'Oh Snap!',
            description: 'Something went wrong. Please try again.'));
    }
  }
}
