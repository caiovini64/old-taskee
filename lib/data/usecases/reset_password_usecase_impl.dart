import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class ResetPasswordUsecase implements IResetPasswordUsecase {
  final IResetPasswordDatasource datasource;
  ResetPasswordUsecase(this.datasource);

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    try {
      final result = await datasource.sendPasswordResetEmail(email);
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on AuthenticationException catch (error) {
      return Left(
          AuthenticationFailure(code: error.code, message: error.message));
    }
  }

  @override
  Future<Either<Failure, String>> confirmPasswordReset(
      String code, String newPassword) async {
    final result = await datasource.confirmPasswordReset(code, newPassword);
    return Right(result);
  }
}
