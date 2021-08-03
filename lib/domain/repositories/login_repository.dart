import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
}
