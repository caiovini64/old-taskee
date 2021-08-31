import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class ResetPasswordUsecase implements IResetPasswordUsecase {
  final IResetPasswordDatasource datasource;
  ResetPasswordUsecase(this.datasource);

  @override
  Future<Either<Failure, String>> sendPasswordResetEmail(String email) async {
    final result = await datasource.sendPasswordResetEmail(email);
    return Right(result);
  }

  @override
  Future<Either<Failure, String>> confirmPasswordReset(
      String code, String newPassword) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }
}
