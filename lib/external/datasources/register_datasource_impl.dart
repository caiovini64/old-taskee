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
    final json = jsonDecode(response.data);
    final user = UserModel.fromJson(json);
    return user;
  }
}
