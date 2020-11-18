import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../constant/config.dart';

@lazySingleton
class Api {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '${Config.BASE_URL}/api',
      connectTimeout: 60 * 1 * 1000, // 1 minutes
    ),
  );

  void removeDefaultAuthHeader() {
    dio.options.headers = {
      'Authorization': '',
    };
  }

  void setDefaultAuthHeader(String jwt) {
    dio.options.headers = {
      'Authorization': 'Bearer $jwt',
    };
  }
}
