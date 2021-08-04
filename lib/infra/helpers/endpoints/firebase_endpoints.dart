import 'package:taskee/core/config.dart';

class FirebaseEndpoints {
  static String login(String categorie) =>
      firebaseAuthUrl + categorie + '?key=' + Config.firebaseApiKey;
}

const firebaseAuthUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:';
