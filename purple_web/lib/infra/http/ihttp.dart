import 'package:dio/dio.dart';

import '../infra.dart';

abstract class IHttpClient {
  Future<Response<T>> post<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final bool authenticationMethod = false,
  });

  ///
  /// Adds a custom interceptor to handle requests, responses and errors.
  ///
  /// If there's more than one interceptor, they'll be executed sequentially.
  ///
  void addInterceptors(List<HttpInterceptor> interceptors);
}
