import 'package:playstation_store/core/model/device_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceIdStorageService {
  static const String _lastIdKey = 'last_device_id';

  /// يرجع آخر id محفوظ أو 0 إن لم يكن موجود
  static Future<int> getLastId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_lastIdKey) ?? 0;
  }

  /// يحفظ آخر id مستخدم
  static Future<void> saveLastId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastIdKey, id);
  }

  /// يرجع id جديد + يزيده
  static Future<int> getNextId() async {
    final lastId = await getLastId();
    final nextId = lastId + 1;
    await saveLastId(nextId);
    return nextId;
  }
}

class DeviceStorageService {
  static const _key = 'devices_list';

  static Future<void> saveDevices(List<DeviceModel> devices) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = devices.map((device) => device.toJson()).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<DeviceModel>> loadDevices() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((json) => DeviceModel.fromJson(json)).toList();
  }

  static Future<void> deleteDeviceById(String id) async {
    final devices = await loadDevices();
    final updated = devices.where((device) => device.id != id).toList();
    await saveDevices(updated);
  }

  static Future<void> clearAllDevices() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
