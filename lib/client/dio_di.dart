import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioDi {
  Dio get dio {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 30).inMilliseconds;

    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));

    return dio;
  }
}
