import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.serverError(
      {required String title, required String description}) = ServerError;
  const factory AuthFailure.emailAlreadyInUse(
      {required String title, required String description}) = EmailAlreadyInUse;
  const factory AuthFailure.mobileNumberInUse(
      {required String title, required String description}) = mobileNumberInUse;
  const factory AuthFailure.wrongPassword(
      {required String title, required String description}) = WrongPassword;
  const factory AuthFailure.userNotFound(
      {required String title, required String description}) = UserNotFound;
  const factory AuthFailure.recordNotFound(
      {required String title, required String description}) = RecordNotFound;
  const factory AuthFailure.invalidInput(
      {required String title, required String description}) = InvalidInput;
  const factory AuthFailure.signupDisabled(
      {required String title, required String description}) = SignupDisabled;
  const factory AuthFailure.userBanned(
      {required String title, required String description}) = UserBanned;
  const factory AuthFailure.emailNotConfirmed(
      {required String title, required String description}) = EmailNotConfirmed;
  const factory AuthFailure.tooManyRequests(
      {required String title, required String description}) = TooManyRequests;
  const factory AuthFailure.sessionExpired(
      {required String title, required String description}) = SessionExpired;
  const factory AuthFailure.invalidCredentials(
      {required String title,
      required String description}) = InvalidCredentials;
  const factory AuthFailure.otpExpired(
      {required String title, required String description}) = OtpExpired;
  const factory AuthFailure.userNotSubscribed(
      {required String title, required String description}) = UserNotSubscribed;
}
