// ignore_for_file: public_member_api_docs

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_cat_api/the_cat_api.dart';

part 'the_cat_api_constructor.g.dart';

/// {@template the_cat_api}
/// A Flutter implementation of the TheCatApi that uses dio and retrofit
/// {@endtemplate}
@RestApi()
abstract class TheCatApiConstructor {
  /// {@macro TheCatApiConstructor}
  factory TheCatApiConstructor(Dio dio, {String? baseUrl}) =
      _TheCatApiConstructor;

  @GET('/breeds')
  Future<List<CatBreed>> getCatBreeds();
  @GET('/breeds/search')
  Future<List<CatBreed>> getCatBreedsBySearch(@Query('q') String search);
}
