import 'package:taskee/data/models/models.dart';

abstract class ILoginDatasource {
  Future<UserModel> login(String email, String password);
}
