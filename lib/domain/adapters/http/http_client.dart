import 'package:taskee/domain/adapters/http/http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> patch(String url, {required Map<String, dynamic> body});
  Future<HttpResponse> delete(String url);
}
