mixin AuthValidator {
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
