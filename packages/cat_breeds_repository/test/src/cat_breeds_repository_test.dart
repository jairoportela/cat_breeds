// ignore_for_file: prefer_const_constructors

import 'package:cat_breeds_repository/cat_breeds_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_cat_api/the_cat_api.dart';

void main() {
  group('CatBreedsRepository', () {
    test('can be instantiated', () {
      expect(
        CatBreedsRepository(
          api: TheCatApi.build(),
        ),
        isNotNull,
      );
    });
  });
}
