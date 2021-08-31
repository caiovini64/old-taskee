import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IResetPasswordUsecase {
  Future<Either<Failure, String>> sendPasswordResetEmail(String email);
  Future<Either<Failure, String>> confirmPasswordReset(
      String code, String newPassword);
}
