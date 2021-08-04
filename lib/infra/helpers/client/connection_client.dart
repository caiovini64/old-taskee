import 'package:taskee/infra/helpers/helpers.dart';

abstract class IConnectionClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}
