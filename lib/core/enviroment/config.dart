import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String _get(String name) => dotenv.env[name] ?? '';

  static String get firebaseApiKey => _get('firebaseApiKey');
  static String get databaseUrl => _get('realtimeDBUrl');
}
