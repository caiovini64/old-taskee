import 'package:get/get.dart';
import 'package:taskee/data/models/models.dart';

class Properties extends GetxService {
  Future<Properties> init() async => this;
  static Properties get instance => Get.find();

  final _user = UserModel(id: '', email: '', token: '').obs;

  UserModel get user => _user.value;
  set user(UserModel newUser) => _user.value = newUser;
}
