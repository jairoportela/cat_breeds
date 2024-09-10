import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_cat_api/src/dio/interceptors/the_cat_api_interceptor.dart';
import 'package:the_cat_api/src/dio/the_cat_api_constructor.dart';
import 'package:the_cat_api/src/the_cat_api_const.dart';
import 'package:the_cat_api/the_cat_api.dart';

/// {@template the_cat_api}
/// A Flutter implementation of the TheCatApi that uses dio and retrofit
/// {@endtemplate}
@RestApi()
class TheCatApi {
  ///Construct the api with the apiKey interceptor and base url
  static TheCatApiConstructor build() {
    final apiInterceptor = TheCatApiAuthInterceptor(TheCatApiConsts.privateKey);

    final dio = Dio(
      BaseOptions(
        baseUrl: TheCatApiConsts.baseUrl,
        receiveTimeout: const Duration(seconds: 3000),
        sendTimeout: const Duration(seconds: 3000),
        connectTimeout: const Duration(seconds: 3000),
      ),
    )..interceptors.add(apiInterceptor);

    return TheCatApiConstructor(dio);
  }
}
