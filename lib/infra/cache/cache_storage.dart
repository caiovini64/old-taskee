abstract class CacheStorage {
  void remove(String key);
  dynamic get(String key);
  void save({required String key, required value});
}
