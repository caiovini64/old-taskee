import 'package:taskee/domain/entities/entities.dart';

abstract class ILoginDatasource {
  Future<UserEntity> login(String email, String password);
}
