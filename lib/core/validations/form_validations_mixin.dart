mixin FormValidations {
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

  String? confirmPassword(String? password1, String? password2) {
    if (password1 != password2)
      return 'Those passwords didn’t match. Try again';
    return null;
  }

  String? validateField(String? text) {
    if (text == null || text == '' || text.isEmpty)
      return 'Please, type something!';
    return null;
  }
}
