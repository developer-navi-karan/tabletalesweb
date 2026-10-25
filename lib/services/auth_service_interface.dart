import 'package:dartz/dartz.dart';
import 'package:tabletalesweb/data/model/built_user.dart';
import 'package:tabletalesweb/domain/auth/auth_failure.dart';

abstract class AuthServiceInterface {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required BuiltUser builtUser});

  Future<Either<AuthFailure, Unit>> checkPhoneExists(
      {required String phoneNumber});

  Future<Either<AuthFailure, Unit>> checkEmailExists(
      {required String emailAddress});

  Future<Either<AuthFailure, Unit>> login(
      {required String emailAddress, required String password});

  Future<Either<AuthFailure, Unit>> isUserSubscribed({required String userId});

  Future<Either<AuthFailure, Unit>> updateUser({required BuiltUser builtUser});

  Future<Either<AuthFailure, BuiltUser>> getUser();

  Future<Either<AuthFailure, String>> getOtp(String id);

  Future<Either<AuthFailure, Unit>> updateAuthUser(
      {required BuiltUser builtUser});

  Future<void> sendResetCode(String email);

  Future<Either<AuthFailure, Unit>> setNewPassword(String newPassword);

  Future<Either<AuthFailure, Unit>> verifyResetCode(String email, String code);

  Future<Either<AuthFailure, Unit>> verifyPasswordResetCode(String oobCode);

  Future<Either<AuthFailure, Unit>> confirmPasswordReset(
      String oobCode, String password);

  Future<Either<AuthFailure, Unit>> verify({
    required String email,
    required String code,
  });
}
