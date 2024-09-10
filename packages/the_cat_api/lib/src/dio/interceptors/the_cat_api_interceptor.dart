import 'package:dio/dio.dart';

///Interceptor to add the api key header
class TheCatApiAuthInterceptor extends Interceptor {
  /// Creates a [TheCatApiAuthInterceptor].
  ///
  /// All parameters are required.
  TheCatApiAuthInterceptor(
    this._apiKey,
  );

  final String _apiKey;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['x-api-key'] = _apiKey;
    return super.onRequest(options, handler);
  }
}
