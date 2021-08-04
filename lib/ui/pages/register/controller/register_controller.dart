import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterController extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;

  RegisterController(this.registerUsecase) : super(RegisterInitial());

  String failureMessage = '';

  Future<void> login(String email, String password) async {
    emit(RegisterLoading());
    final Either<Failure, UserEntity> result =
        await registerUsecase(email, password);
    result.fold((failure) {
      emit(RegisterError());
      failureMessage = failure.message;
    }, (right) {
      print(right);
      emit(RegisterDone());
    });
  }
}
