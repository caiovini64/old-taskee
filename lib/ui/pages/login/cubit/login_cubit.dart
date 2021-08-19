import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/ui/pages/home/components/toDo/todo_page.dart';
import 'package:taskee/ui/pages/home/home_page.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ILoginUsecase _loginUsecase;
  LoginCubit(this._loginUsecase) : super(LoginInitial());

  GetIt serviceLocator = GetIt.instance;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final result = await _loginUsecase.login(email.trim(), password);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (right) {
        emit(LoginDone());
        _saveUser(right.email, right.id, right.token);
        Get.toNamed(HomePage.route);
      },
    );
  }

  void _saveUser(String email, String id, String token) {
    serviceLocator.registerLazySingleton<UserModel>(
      () => UserModel(
        email: email,
        id: id,
        token: token,
      ),
    );
  }
}
