import 'package:the_cat_api/the_cat_api.dart';

/// {@template cat_breeds_repository}
/// A repository that handles catbreed related requests.
/// {@endtemplate}
class CatBreedsRepository {
  /// {@macro cat_breeds_repository}
  const CatBreedsRepository({
    required TheCatApiConstructor api,
  }) : _api = api;
  final TheCatApiConstructor _api;

  ///Get cat breeds with `search` optional
  Future<List<CatBreed>> getCatBreeds(String? search) async {
    try {
      final query = search != null && search.isNotEmpty
          ? _api.getCatBreedsBySearch(search)
          : _api.getCatBreeds();
      final result = await query;
      if (search != null && result.isEmpty) throw CatBreedsNotFoundFailure();
      return result;
    } on CatBreedsNotFoundFailure {
      rethrow;
    } catch (error) {
      throw CatBreedsRequestFailure();
    }
  }
}

/// Exception thrown when getCatBreeds fails.
class CatBreedsRequestFailure implements Exception {}

/// Exception thrown when cat breeds for provided search are not found.
class CatBreedsNotFoundFailure implements Exception {}
