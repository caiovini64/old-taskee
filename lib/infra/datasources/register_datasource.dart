import 'package:taskee/infra/models/user_model.dart';

abstract class IRegisterDatasource {
  Future<UserModel> register(String email, String password);
}
