import 'dart:convert';

import 'package:http/http.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/helpers.dart';
import 'package:taskee/infra/models/models.dart';

class RegisterDatasource implements IRegisterDatasource {
  final IConnectionClient client;
  final String url;
  RegisterDatasource({
    required this.client,
    required this.url,
  });

  @override
  Future<UserModel> register(String email, String password) async {
    final response = await client.post(
      url,
      body: {
        "email": email,
        "password": password,
        "returnSecureToken": true,
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.data);
      final user = UserModel.fromJson(json);
      return user;
    } else if (response.statusCode == 400) {
      final exception =
          AuthenticationException.fromJson(jsonDecode(response.data));
      throw AuthenticationException(
        code: response.statusCode,
        message: exception.message,
      );
    } else {
      throw ServerException();
    }
  }
}
