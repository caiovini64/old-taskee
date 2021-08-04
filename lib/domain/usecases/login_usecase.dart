import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/user_entity.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/repositories/login_repository.dart';

class LoginUsecase implements AuthUsecase {
  final ILoginRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    final result = await repository.login(email, password);
    return result;
  }
}
