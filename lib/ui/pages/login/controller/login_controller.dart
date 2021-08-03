import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginController(this.loginUsecase) : super(LoginInitial());

  String failureMessage = '';

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final Either<Failure, UserEntity> result =
        await loginUsecase(email, password);
    result.fold((failure) {
      emit(LoginError());
      failureMessage = failure.message;
    }, (right) {
      print(right);
      emit(LoginDone());
    });
  }

  String? validatePassword(String? value) {
    if (value!.length < 6 && value.isEmpty)
      return 'Password should contain more than 6 characters';
    return null;
  }

  String? validateEmail(String? value) {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value!);
    if (!emailValid) return 'Invalid email!';
    return null;
  }
}
