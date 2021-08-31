import 'package:get/get.dart';

enum AuthError {
  somethingWrong,
  emailExists,
  tooManyAttempts,
  emailNotFound,
  invalidPassword,
  userDisabled,
  invalid_code,
  expired_code,
}

extension AuthErrorExtension on AuthError {
  String get description {
    switch (this) {
      case AuthError.somethingWrong:
        return 'Something wrong!'.tr;
      case AuthError.emailExists:
        return 'The email exists'.tr;
      case AuthError.tooManyAttempts:
        return 'Too many attempts, try again later!'.tr;
      case AuthError.emailNotFound:
        return 'Email not found.'.tr;
      case AuthError.invalidPassword:
        return 'Invalid password.'.tr;
      case AuthError.userDisabled:
        return 'User disabled.'.tr;
      case AuthError.invalid_code:
        return 'Invalid Code.'.tr;
      case AuthError.expired_code:
        return 'Expired Code.'.tr;
    }
  }
}
