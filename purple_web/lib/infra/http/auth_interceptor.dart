import 'dart:async';
import 'package:dio/dio.dart';
import '../../lib.dart';

///
/// Provide a way to intercept HTTP requests to handle the request, response and errors.
///
class AuthInterceptor extends HttpInterceptor {
  /// Intercept the HTTP request being sent.
  /// Receive the request settings and the current http client as arguments.
  @override
  FutureOr<Dio> onRequest(
    String url,
    Dio dio,
  ) {
    if (sessionToken.isNotEmpty) {
      dio.options.headers.addAll({'X-Parse-Session-Token': sessionToken});
    }
    return super.onRequest(
      url,
      dio,
    );
  }
}
