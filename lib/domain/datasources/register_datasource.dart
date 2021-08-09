import 'package:taskee/domain/entities/entities.dart';

abstract class IRegisterDatasource {
  Future<UserEntity> register(String email, String password);
}
