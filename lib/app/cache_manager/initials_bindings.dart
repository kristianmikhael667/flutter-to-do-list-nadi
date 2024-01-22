import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'auth_manager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put(ApiService());
    Get.put<AuthManagerController>(
      (AuthManagerController()),
    );
  }
}
