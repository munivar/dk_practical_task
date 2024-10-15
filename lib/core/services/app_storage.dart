import 'package:hive/hive.dart';

class AppStorage {
  static Future<void> setData(String boxName, String key, dynamic value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> getData(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }

  static remove(String boxName, String key) async {
    var box = await Hive.openBox(boxName);
    await box.delete(key);
  }

  static clearData(String boxName) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
  }
}
