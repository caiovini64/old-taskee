import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taskee/data/helpers/helpers.dart';

class HttpClient implements IConnectionClient {
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
