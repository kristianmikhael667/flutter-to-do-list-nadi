import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/tools.dart';
import '../../cache_manager/auth_manager.dart';
import '../../cache_manager/cache_manager.dart';
import '../../routes/app_pages.dart';

class SplashScreenController extends GetxController
    with CacheManager, GetSingleTickerProviderStateMixin {
  //TODO: Implement SplashScreenController
  final authManager = Get.find<AuthManagerController>();
  late AnimationController animationController;
  late Animation<double> animation;
  var checkUpdate = false.obs;

  startSplashScreen() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();

    animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        var duration = const Duration(seconds: 2);
        return Future.delayed(duration)
            .then((value) => Get.offNamed(Routes.LOGIN));
      }
    });
  }

  @override
  void onInit() {
    printConsole('initializing...');
    startSplashScreen();
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
