import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:taskee/domain/usecases/usecases.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IRegisterUsecase _registerUsecase;

  RegisterCubit(this._registerUsecase) : super(Initial());

  Future<void> register(String email, String password) async {
    emit(Loading());
    final result = await _registerUsecase.register(email.trim(), password);
    result.fold(
      (failure) => emit(Error(failure.message)),
      (right) => emit(Success()),
    );
  }
}
