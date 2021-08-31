import 'dart:convert';

import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';

class ResetPasswordDatasource implements IResetPasswordDatasource {
  final IHttpClient client;
  final String url;
  ResetPasswordDatasource({
    required this.client,
    required this.url,
  });
  @override
  Future<String> sendPasswordResetEmail(String email) async {
    final response = await client.post(
      url,
      body: {
        "requrestType": 'PASSWORD_RESET',
        "email": email,
      },
    );
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
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

  @override
  Future<String> confirmPasswordReset(String code, String newPassword) async {
    final response = await client.post(
      url,
      body: {
        "oobCode": code,
        "newPassword": newPassword,
      },
    );
    if (response.statusCode == 200) {
      return jsonEncode(response.data);
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
