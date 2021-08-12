import 'package:flutter/cupertino.dart';

mixin KeyboardManager {
  void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).requestFocus(new FocusNode());
}
