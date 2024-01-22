import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nasari_flutter/app/cache_manager/cache_manager.dart';
import 'package:nasari_flutter/app/services/dio_client/dio_client.dart';
import 'package:nasari_flutter/constants/constants.dart';

class AuthClient with CacheManager {
  final DioClient dioClient;

  AuthClient({required this.dioClient});

  // LOGIN
  Future<Response> loginClient(String phone, String pin) async {
    try {
      final response = await dioClient.post(ApiString.loginByPin,
          data: json.encode({
            'phone': phone,
            'pin': pin,
          }),
          options: Options(headers: {
            'DeviceId': '5917a80b8c6dcd66',
            'FcmToken': '5917a80b8c6dcd66',
            'Application': 'QGROW'
          }));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> logout(String token, String deviceId) async {
    try {
      var response = await dioClient.post(ApiString.userLogout, data: {});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
