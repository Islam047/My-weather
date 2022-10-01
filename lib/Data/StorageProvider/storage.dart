
import 'package:hive_flutter/adapters.dart';

class HiveService {
  static const dbName = "user_location";
  static final Box _box = Hive.box(dbName);

  static Future<void> setData<T>(StorageKey key, T value) async {
    await _box.put(key.name, value);
  }

  // #readDataHiveService
  static T readData<T>(StorageKey key, {T? defaultValue}) {
    return _box.get(key.name, defaultValue: defaultValue);
  }
  static Future<void> clearData()async{
      _box.clear();
  }
}

enum StorageKey { userLocation }
