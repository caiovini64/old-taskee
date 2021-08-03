import 'package:taskee/infra/helpers/endpoints/api_key.dart';

class FirebaseEndpoints {
  static String login(String categorie) =>
      firebaseAuthUrl + categorie + '?key=' + firebaseApiKey;
}
