import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/login_usecase.dart';
import 'package:taskee/ui/helpers/mixins/auth_validator_mixin.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> with AuthValidator {
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
}
