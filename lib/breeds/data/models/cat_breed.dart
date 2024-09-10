import 'package:equatable/equatable.dart';
import 'package:the_cat_api/the_cat_api.dart';

class CatBreedModel extends Equatable {
  final String id;
  final String name;
  final String countryName;
  final int? intelligence;
  final int? adaptability;
  final String? lifeSpan;
  final String? imageUrl;
  final String? imageId;
  final String description;

  bool get imageIsNotEmpty =>
      imageUrl != null && imageUrl?.isNotEmpty == true && imageId != null;

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
