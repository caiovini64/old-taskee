import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/adapters/cache/get_storage_adapter.dart';
import 'package:taskee/domain/adapters/adapters.dart';

class MockGetStorage extends Mock implements GetStorage {}

void main() {
  late ICacheStorage storageAdapter;
  late GetStorage getStorage;
  late String key;
  late dynamic value;

  setUp(() {
    key = faker.randomGenerator.string(10);
    value = faker.randomGenerator.string(100);
    getStorage = MockGetStorage();
    storageAdapter = GetStorageAdapter(getStorage);
  });

  void mockRemove() =>
      when(() => getStorage.remove(any())).thenAnswer((_) async => {});
  void mockWrite() =>
      when(() => getStorage.write(any(), any())).thenAnswer((_) async => {});
  void mockRead() =>
      when(() => getStorage.read(any())).thenAnswer((_) async => {'aaa'});

  test('should call getStorage with correct values when removing', () async {
    mockRemove();
    await storageAdapter.remove(key);
    verify(() => getStorage.remove(key)).called(1);
  });

  test('should call getStorage with correct values when saving', () async {
    mockRemove();
    mockWrite();
    await storageAdapter.save(key: key, value: value);
    verify(() => getStorage.write(key, value)).called(1);
  });

  test('should call getStorage with correct values when reading', () async {
    mockRead();
    await storageAdapter.get(key);
    verify(() => getStorage.read(key)).called(1);
  });
}
