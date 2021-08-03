import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/infra/models/user_model.dart';

final kUserEntity = UserEntity(
  email: 'email@email.com',
  id: '123',
  token: 'alskdlasdw',
);

final kUserModel = UserModel(
  email: 'email@email.com',
  id: '123',
  token: 'alskdlasdw',
);

final kUserJson = """{
  "kind": "identitytoolkit#VerifyPasswordResponse",
  "localId": "123", 
  "email": "email@email.com", 
  "displayName": "", 
  "idToken": "alskdlasdw"
}""";
