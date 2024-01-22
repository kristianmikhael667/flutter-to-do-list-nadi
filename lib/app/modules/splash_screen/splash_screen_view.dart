import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nasari_flutter/constants/color_palette.dart';
import 'package:upgrader/upgrader.dart';

import '../../../constants/tools.dart';
import 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primary,
        body: UpgradeAlert(
          upgrader: Upgrader(
            durationUntilAlertAgain: const Duration(days: 1),
            willDisplayUpgrade: (
                {appStoreVersion,
                display = true,
                installedVersion,
                minAppVersion}) async {
              if (appStoreVersion != null) {
                var listAppStore = appStoreVersion.split('.');
                var listInstalled = installedVersion!.split(".");
                controller.checkUpdate.value = int.parse(listInstalled.last) <
                    int.parse(listAppStore.last);
                printConsole('$appStoreVersion, $installedVersion');
              }
            },
          ),
          child: FadeTransition(
            opacity: controller.animation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/nadi.png',
                    height: 120.h,
                    width: 240.w,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
