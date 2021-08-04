import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/datasources.dart';

class RegisterRepository implements IRegisterRepository {
  final IRegisterDatasource datasource;
  RegisterRepository(this.datasource);

  @override
  Future<Either<Failure, UserEntity>> register(
      String email, String password) async {
    final result = await datasource.register(email, password);
    return Right(result);
  }
}
