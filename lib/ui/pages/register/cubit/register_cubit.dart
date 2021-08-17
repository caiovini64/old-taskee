import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:taskee/domain/usecases/usecases.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IRegisterUsecase _registerUsecase;

  RegisterCubit(this._registerUsecase) : super(RegisterInitial());

  Future<void> register(String email, String password) async {
    emit(RegisterLoading());
    final result = await _registerUsecase.register(email.trim(), password);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (right) => emit(RegisterSuccess()),
    );
  }
}
