import 'package:taskee/data/models/models.dart';

abstract class IRegisterDatasource {
  Future<UserModel> register(String email, String password);
}
