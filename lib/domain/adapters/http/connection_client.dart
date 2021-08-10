import 'package:taskee/domain/helpers/http/http_response.dart';

abstract class IConnectionClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}
