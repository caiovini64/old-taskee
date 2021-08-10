import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/helpers/helpers.dart';

class HttpAdapter implements IConnectionClient {
  final client = http.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final http.Response response = await client.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }

  @override
  Future<HttpResponse> post(String url,
      {required Map<String, dynamic> body}) async {
    final http.Response response = await client.post(
      Uri.parse(url),
      body: jsonEncode(body),
    );
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
