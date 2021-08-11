import 'package:taskee/domain/helpers/http/http_response.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String url);
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body});
}
