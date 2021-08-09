import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IRegisterUsecase {
  Future<Either<Failure, UserEntity>> register(String email, String password);
}
