import 'package:flutter/cupertino.dart';
import 'package:taskee/ui/components/auth_error_message.dart';
import 'package:taskee/ui/helpers/errors/auth_error.dart';

mixin UIErrorManager {
  void showAuthErrorMessage(BuildContext context, String error) {
    AuthError authError = _manageError(error);
    errorMessageWidget(context, authError.description);
  }

  AuthError _manageError(String error) {
    if (error == 'EMAIL_NOT_FOUND') return AuthError.emailNotFound;
    if (error == 'INVALID_PASSWORD') return AuthError.invalidPassword;
    if (error == 'USER_DISABLED') return AuthError.userDisabled;
    if (error == 'EMAIL_EXISTS') return AuthError.emailExists;
    if (error == 'TOO_MANY_ATTEMPTS_TRY_LATER')
      return AuthError.tooManyAttempts;
    return AuthError.somethingWrong;
  }

  void showErrorMessage(BuildContext context, String error) {
    errorMessageWidget(context, error);
  }
}
