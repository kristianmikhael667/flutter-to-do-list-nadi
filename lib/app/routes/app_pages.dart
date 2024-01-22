import 'package:get/get.dart';
import 'package:nasari_flutter/app/modules/home/bindings/home_bindings.dart';
import 'package:nasari_flutter/app/modules/home/views/home_view.dart';
import 'package:nasari_flutter/app/modules/login/bindings/login_binding.dart';
import 'package:nasari_flutter/app/modules/login/views/login_view.dart';
import 'package:nasari_flutter/app/modules/splash_screen/splash_screen_binding.dart';
import 'package:nasari_flutter/app/modules/splash_screen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    )
  ];
}
