abstract class ICacheStorage {
  Future<void> remove(String key);
  Future<dynamic> get(String key);
  Future<void> save({required String key, required value});
}
