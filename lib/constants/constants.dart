import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';
import 'package:dio/dio.dart';

var dioClient = DioClient(Dio());

class ApiString {
  static String get devDomain =>
      'api-dev.qgrow'; // sementara pinjem server saya dlu buat akses api nya
  static String get tld => '.id';
  static String get schema => 'https://';
  static int get receiveTimeout => 15000;
  static int get connectionTimeout => 15000;

  static String baseUrl() {
    return "$schema$devDomain$tld";
  }

  // API AUTH
  static String get loginByPin => '/user-service/loginbypin';
  static String get userLogout => '/user-service/logout';
}
