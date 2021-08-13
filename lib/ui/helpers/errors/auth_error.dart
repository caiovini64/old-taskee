enum AuthError {
  somethingWrong,
  emailExists,
  tooManyAttempts,
  emailNotFound,
  invalidPassword,
  userDisabled,
}

extension AuthErrorExtension on AuthError {
  String get description {
    switch (this) {
      case AuthError.somethingWrong:
        return 'Something wrong!';
      case AuthError.emailExists:
        return 'The email exists';
      case AuthError.tooManyAttempts:
        return 'Too many attempts, try again later!';
      case AuthError.emailNotFound:
        return 'Email not found.';
      case AuthError.invalidPassword:
        return 'Invalid password.';
      case AuthError.userDisabled:
        return 'User disabled.';
    }
  }
}
