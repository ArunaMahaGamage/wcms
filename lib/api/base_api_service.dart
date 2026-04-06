import 'package:dio/dio.dart';
class BaseApiService {

  Dio getDio() {
    // Use 10.0.2.2 for Android Emulator to hit localhost
    final Dio dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8080",
      connectTimeout: const Duration(seconds: 20),
      // Increased receiveTimeout to 15 seconds to prevent the current error
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ));
    return dio;
  }
}