import 'dart:convert';

import 'package:nasari_flutter/app/cache_manager/cache_manager.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:nasari_flutter/app/models/user_model.dart';
import 'package:nasari_flutter/app/routes/app_pages.dart';
import 'package:nasari_flutter/app/services/auth_services.dart';
import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';

class AuthManagerController extends GetxController with CacheManager {
  //TODO: Implement AuthManagerController
  static var dioClient = DioClient(Dio());
  final authClient = AuthClient(dioClient: dioClient);
  var loggedIn = false.obs;
  var googleLogin = false.obs;
  var loadCompleted = false.obs;
  var user = UserModel();
  var fcmToken = ''.obs;
  var _isBindingDana = false.obs;

  Rx<bool> get isBindingDana => _isBindingDana;
  UserModel get users => user;

  void setUser(UserModel users) {
    user = users;
    update();
  }

  void deleteUser() {
    user = UserModel();
  }

  void logout() {
    Get.back();
    authClient.logout(getToken()!, getDeviceId()!).then((value) {
      print("apa yg terjadi $value");
      Map<String, dynamic> responseMap = jsonDecode(value.toString());
      Map<String, dynamic> meta = responseMap['meta'];
      bool success = meta['success'];
      if (success == true) {
        loggedIn(false);
        removeToken();
        deleteUser();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        throw "Can't logout";
      }
    });
  }

  void forceLogout() {
    loggedIn(false);
    removeToken();
    deleteUser();
    removeUser();
    Get.offAllNamed(Routes.LOGIN);
  }

  bool checkUserExists() {
    final userExists = getUserDataLocal();
    if (userExists != null) {
      return true;
    } else {
      return false;
    }
  }

  bool checkTokenStatus() {
    final token = getToken();
    // print('Check $token');
    if (token != null) {
      print('Token found');
      return true;
    } else {
      print('Token not found');
      return false;
    }
  }

  bool? checkDanaTokenStatus() {
    final tokenDana = getTokenDana();
    print('Check $tokenDana');
    if (tokenDana != null) {
      print('Token found');
      _isBindingDana.value = true;
    } else {
      print('Token not found');
      _isBindingDana.value = false;
    }
    return null;
  }

  bool checkIsFirstScreen() {
    final isFirstScreen = getFirstTime();
    if (isFirstScreen != null) {
      return false;
    } else {
      return true;
    }
  }
}
