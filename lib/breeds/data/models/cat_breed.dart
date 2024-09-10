import 'package:equatable/equatable.dart';
import 'package:the_cat_api/the_cat_api.dart';

/// Represents a model for cat breed information.

class CatBreedModel extends Equatable {
  /// Constructs a `CatBreedModel` instance.
  ///
  /// All parameters are required.
  const CatBreedModel({
    required this.id,
    required this.name,
    required this.countryName,
    required this.intelligence,
    required this.adaptability,
    required this.lifeSpan,
    required this.imageUrl,
    required this.imageId,
    required this.description,
  });

  /// Creates a `CatBreedModel` instance from a `CatBreed` object
  factory CatBreedModel.fromRepository(CatBreed catBreed) {
    return CatBreedModel(
      id: catBreed.id,
      name: catBreed.name,
      countryName: catBreed.origin,
      intelligence: catBreed.intelligence,
      adaptability: catBreed.adaptability,
      lifeSpan: catBreed.lifeSpan,
      imageUrl: catBreed.image?.url,
      imageId: catBreed.image?.id,
      description: catBreed.description,
    );
  }

  /// The unique identifier for the cat breed.
  final String id;

  /// The name of the cat breed.
  final String name;

  /// The name of the country where the cat breed originated.
  final String countryName;

  /// The intelligence level of the cat breed (optional).
  final int? intelligence;

  /// The adaptability level of the cat breed (optional).
  final int? adaptability;

  /// The life span of the cat breed (optional).
  final String? lifeSpan;

  /// The URL of an image representing the cat breed (optional).
  final String? imageUrl;

  /// The unique identifier for the image (optional).
  final String? imageId;

  /// A description of the cat breed.
  final String description;

  /// Checks if both the `imageUrl` and `imageId` are not null and `imageUrl`
  /// is not empty.
  bool get imageIsNotEmpty =>
      imageUrl != null && (imageUrl?.isNotEmpty ?? false) && imageId != null;

  /// Overrides the `props` getter from `Equatable` to define the properties
  /// used for equality comparison.
  @override
  List<Object?> get props => [
        id,
        name,
        countryName,
        intelligence,
        adaptability,
        lifeSpan,
        imageUrl,
        imageId,
        description,
      ];
}
