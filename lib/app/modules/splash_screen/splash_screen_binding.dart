import 'package:get/get.dart';

import '../../cache_manager/auth_manager.dart';
import 'splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashScreenController>(
    //   () => SplashScreenController(),
    // );
    Get.put(SplashScreenController());
    Get.lazyPut(() => AuthManagerController());
    // Get.lazyPut(() => WalletManagerController());
  }
}
