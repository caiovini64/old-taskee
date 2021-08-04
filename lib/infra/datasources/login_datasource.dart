import 'package:taskee/infra/models/user_model.dart';

abstract class ILoginDatasource {
  Future<UserModel> login(String email, String password);
}
