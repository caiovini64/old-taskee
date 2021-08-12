import 'package:dartz/dartz.dart';

import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/data/helpers/helpers.dart';

class RegisterUsecase implements IRegisterUsecase {
  final IRegisterDatasource datasource;
  RegisterUsecase(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> register(
      String email, String password) async {
    try {
      final result = await datasource.register(email, password);
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
