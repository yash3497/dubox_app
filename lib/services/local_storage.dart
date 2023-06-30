import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static Future<void> save(String key, String value) async {
    GetStorage storage = GetStorage();
    await storage.write(key, value);
  }

  static Future<String> read(String key) async {
    GetStorage storage = GetStorage();
    return await storage.read(key);
  }

  static Future<void> remove() async {
    GetStorage storage = GetStorage();
    await storage.erase();
  }
}
