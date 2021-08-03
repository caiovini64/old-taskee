import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginController(this.loginUsecase) : super(LoginInitial());

  //TODO: Implemented login method
  void login(String email, String password) {
    emit(LoginLoading());
    loginUsecase(email, password);
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
