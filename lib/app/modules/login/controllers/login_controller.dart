import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasari_flutter/app/cache_manager/auth_manager.dart';
import 'package:nasari_flutter/app/cache_manager/cache_manager.dart';
import 'package:nasari_flutter/app/models/user_model.dart';
import 'package:nasari_flutter/app/routes/app_pages.dart';
import 'package:nasari_flutter/app/services/auth_services.dart';
import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';
import 'package:nasari_flutter/constants/tools.dart';

class LoginController extends GetxController with CacheManager {
  final authClient = AuthClient(dioClient: DioClient(Dio()));
  final PageController pageController = PageController();
  final authManager = Get.find<AuthManagerController>();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController pinTextController = TextEditingController();
  var isPinBlock = false.obs;
  var isLoading = false.obs;
  var userModel = UserModel();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future loginAction(String phone, String pin) async {
    isLoading(true);
    await authClient.loginClient(phone, pin).then((response) async {
      switch (response.statusCode) {
        case 201:
          final data = ResponseUser.fromJson(response.data);
          if (data.meta!.success == true) {
            Get.offAllNamed(Routes.HOME);
            snackbarWidget(
                'Success', data.meta!.message!, const Duration(seconds: 2));
          } else if (data.meta!.success == false) {
            isLoading(false);
          }
          break;
        default:
      }
    }).catchError((e) {
      printConsole(e);
      isLoading(false);
      phoneTextController.clear();
      pinTextController.clear();
      if (e is DioException) {
        switch (e.response!.statusCode) {
          case 400:
            // PIN BLock
            isPinBlock(true);

            snackbarWidget(
              'PIN',
              'Akses anda telah dibatasi, PIN anda terkunci.',
              const Duration(seconds: 2),
            );
            break;
          case 401:
            // Wrong PIN
            snackbarWidget(
              'PIN',
              'PIN Salah, Silahkan coba lagi',
              const Duration(seconds: 2),
            );
            break;
          case 403:
            authManager.loggedIn(false);
            removeToken();
            authManager.deleteUser();
            Get.offAllNamed(Routes.LOGIN);
            break;
        }
      }
    });
  }
}
