import 'dart:convert';

import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/models/models.dart';

class LoginDatasource implements ILoginDatasource {
  final IHttpClient client;
  final String url;
  LoginDatasource({
    required this.client,
    required this.url,
  });

  @override
  Future<UserModel> login(String email, String password) async {
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
      print(user);
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
