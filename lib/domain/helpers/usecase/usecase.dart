import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class AuthUsecase<Type, Params> {
  Future<Either<Failure, Type>> call(String email, String password);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
