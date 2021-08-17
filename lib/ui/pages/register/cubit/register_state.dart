part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class Initial extends RegisterState {}

class Loading extends RegisterState {}

class Error extends RegisterState {
  final String error;

  Error(this.error);
}

class Success extends RegisterState {}
