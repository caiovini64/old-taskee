import 'package:taskee/infra/models/user_model.dart';

abstract class LoginDatasource {
  Future<UserModel> login(String email, String password);
}
