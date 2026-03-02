import 'package:dio/dio.dart';
class BaseApiService {

  Dio getDio() {
    // Use 10.0.2.2 for Android Emulator to hit localhost
    final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ));
    return dio;
  }
}