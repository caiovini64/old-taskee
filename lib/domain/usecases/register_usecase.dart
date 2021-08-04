import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/user_entity.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/repositories/repositories.dart';

class RegisterUsecase implements AuthUsecase {
  final IRegisterRepository repository;
  RegisterUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    final result = await repository.register(email, password);
    return result;
  }
}
