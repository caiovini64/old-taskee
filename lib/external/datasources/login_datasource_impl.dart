import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/helpers.dart';
import 'package:taskee/infra/models/models.dart';

class LoginDatasource implements ILoginDatasource {
  final IConnectionClient client;
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
    return response.data;
  }
}
