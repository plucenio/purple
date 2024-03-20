import 'dart:async';
import 'package:dio/dio.dart';

///
/// Provide a way to intercept HTTP requests to handle the request, response and errors.
///
class HttpInterceptor {
  /// Intercept the HTTP request being sent.
  /// Receive the request settings and the current http client as arguments.
  FutureOr<Dio> onRequest(
    String url,
    Dio dio,
  ) {
    return dio;
  }
}
