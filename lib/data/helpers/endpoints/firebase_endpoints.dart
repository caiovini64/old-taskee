import 'package:taskee/core/enviroment/config.dart';

class FirebaseEndpoints {
  static String login(String categorie) =>
      firebaseAuthUrl + categorie + '?key=' + Config.firebaseApiKey;
  static String realtimeDb() => Config.databaseUrl;
}

const firebaseAuthUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:';
