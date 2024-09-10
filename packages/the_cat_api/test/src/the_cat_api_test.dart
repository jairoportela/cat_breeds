// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_cat_api/the_cat_api.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('TheCatApi', () {
    late Dio httpClient;
    late TheCatApiConstructor apiClient;

    setUp(() {
      httpClient = MockDio();
      apiClient = TheCatApi.build();
    });

    group('constructor', () {
      test('does require a Dio client', () {
        expect(TheCatApiConstructor(httpClient), isNotNull);
      });
    });
  });
}
