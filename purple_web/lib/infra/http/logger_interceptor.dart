import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../infra.dart';

///
/// Provide a way to intercept HTTP requests to handle the request, response and errors.
///
class LoggerInterceptor extends HttpInterceptor {
  /// Intercept the HTTP request being sent.
  /// Receive the request settings and the current http client as arguments.
  @override
  FutureOr<Dio> onRequest(
    String url,
    Dio dio,
  ) {
    if (kDebugMode) {
      print('Request: ${dio.options.method} ${dio.options.baseUrl}$url');
    }
    return super.onRequest(
      url,
      dio,
    );
  }
}
