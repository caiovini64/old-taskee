import 'package:get_storage/get_storage.dart';
import 'package:taskee/domain/adapters/adapters.dart';

class GetStorageAdapter implements ICacheStorage {
  final GetStorage box;
  GetStorageAdapter(this.box);

  @override
  Future<dynamic> get(String key) {
    return box.read(key);
  }

  @override
  Future<void> remove(String key) async {
    await box.remove(key);
  }

  @override
  Future<void> save({required String key, required value}) async {
    await box.remove(key);
    await box.write(key, value);
  }
}
