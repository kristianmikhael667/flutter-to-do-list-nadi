import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';

enum CacheManagerKey {
  token,
  keywords,
  phone,
  isFirstTime,
  user,
  deviceId,
  fcm,
  tokenDana,
}

mixin CacheManager {
  final box = GetStorage();

  Future<bool> saveUser(
      String? token, String? phone, String? deviceId, String? fcm) async {
    await box.write(CacheManagerKey.token.toString(), token);
    await box.write(CacheManagerKey.phone.toString(), phone);
    await box.write(CacheManagerKey.deviceId.toString(), deviceId);
    await box.write(CacheManagerKey.fcm.toString(), fcm);
    print('Phone Saved : $phone\nToken Saved : $token');
    return true;
  }

  Future<bool> isFirstTime(bool firstScreen) async {
    await box
        .write(CacheManagerKey.isFirstTime.toString(), firstScreen)
        .then((value) => print('First Screen Saved : $firstScreen'));

    return true;
  }

  void saveUserDataLocally(UserModel userData) {
    box.write(CacheManagerKey.user.toString(), userData.toJson());
  }

  UserModel? getUserDataLocal() {
    final user = box.read(CacheManagerKey.user.toString());

    if (user != null) {
      return UserModel.fromJson(user);
    }
    return null;
  }

  String? getToken() {
    return box.read(CacheManagerKey.token.toString());
  }

  String? getPhone() {
    return box.read(CacheManagerKey.phone.toString());
  }

  String? getDeviceId() {
    return box.read(CacheManagerKey.deviceId.toString());
  }

  String? getFcm() {
    return box.read(CacheManagerKey.fcm.toString());
  }

  bool? getFirstTime() {
    return box.read(CacheManagerKey.isFirstTime.toString());
  }

  String? getTokenDana() {
    return box.read(CacheManagerKey.tokenDana.toString());
  }

  Future<void> removeToken() async {
    await box
        .remove(CacheManagerKey.token.toString())
        .then((value) => print('token removed'));

    await box
        .remove(CacheManagerKey.phone.toString())
        .then((value) => print('phone removed'));
  }

  Future<void> removeUser() async {
    await box
        .remove(CacheManagerKey.user.toString())
        .then((value) => print('user removed'));
  }

  Future<void> saveKeywords(List<String> keywords) async {
    print('Saved $keywords');
    try {
      await box.write(CacheManagerKey.keywords.toString(), keywords);
    } catch (e) {
      print('error $e');
    }
  }

  List<String> getKeywords() {
    final list = box.read(CacheManagerKey.keywords.toString());
    print(list);
    if (list != null && list.isNotEmpty) {
      final data = list.map<String>((e) => e.toString()).toList();
      return data;
    } else {
      return [];
    }
  }
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isThemeMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
