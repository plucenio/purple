import 'package:dio/dio.dart';

import 'http.dart';

/// HttpClient adapter for Dio.
///
/// This adapter is used to interface with the Dio package to make HTTP requests.
/// It provides a concrete implementation of the IHttpClient interface for Dio,
/// allowing for easy swapping of HTTP clients if needed.
///
/// Example usage:
/// ```dart
/// final httpClient = HttpClient(dio: Dio());
/// final response = await httpClient.get<String>('https://api.example.com/data');
///
class HttpClient implements IHttpClient {
  final Dio dio;

  HttpClient({required this.dio});

  ///
  /// HTTP interceptors
  ///
  final List<HttpInterceptor> interceptors = [];

  @override
  Future<Response<T>> post<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    final Options? options,
  }) async {
    for (var interceptor in interceptors) {
      await interceptor.onRequest(url, dio);
    }
    final response = await dio.post<T>(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return response;
  }

  @override
  void addInterceptors(List<HttpInterceptor> interceptors) {
    this.interceptors.addAll(interceptors);
  }
}
