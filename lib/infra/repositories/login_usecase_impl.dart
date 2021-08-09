import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/infra/datasources/login_datasource.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';
import 'package:taskee/infra/helpers/exceptions/server_exception.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginDatasource datasource;
  LoginUsecase(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final result = await datasource.login(email, password);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on AuthenticationException catch (error) {
      return Left(
        AuthenticationFailure(code: error.code, message: error.message),
      );
    }
  }
}
