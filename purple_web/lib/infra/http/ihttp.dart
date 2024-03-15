import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response<T>> post<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  });
}
