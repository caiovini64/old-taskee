abstract class IResetPasswordDatasource {
  Future<String> sendPasswordResetEmail(String email);
  Future<String> confirmPasswordReset(String code, String newPassword);
}
