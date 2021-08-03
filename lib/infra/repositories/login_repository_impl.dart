import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/login_datasource.dart';
import 'package:taskee/infra/helpers/exceptions/server_exception.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource datasource;
  LoginRepository(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    try {
      final result = await datasource.login(email, password);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
