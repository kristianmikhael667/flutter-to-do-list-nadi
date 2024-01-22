import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nasari_flutter/app/cache_manager/initials_bindings.dart';
import 'package:nasari_flutter/app/routes/app_pages.dart';
import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  // Set Portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // datetime to Indonesia
  initializeDateFormatting('id_ID');
  Get.put(DioClient(Dio()));
  // local storage
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: Colors.white,
  ));

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        theme: ThemeData(fontFamily: "Poppins", useMaterial3: false),
        title: "NADI",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        initialBinding: InitialBindings(),
      ),
    ),
  );
}
