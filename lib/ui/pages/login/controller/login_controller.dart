import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController() : super(LoginInitial());

  //TODO: Implemented login method
  void login(String email, String password) {
    emit(LoginLoading());
  }
}
