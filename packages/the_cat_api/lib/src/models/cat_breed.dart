import 'package:json_annotation/json_annotation.dart';
import 'package:the_cat_api/src/models/models.dart';
part 'cat_breed.g.dart';

/// Represents a breed of cat.
///
/// This class is annotated with `@JsonSerializable()`, enabling it to be
/// easily serialized to and deserialized from JSON
/// using the `json_serializable` package.

@JsonSerializable()
class CatBreed {
  /// Creates a [CatBreed].
  ///
  /// All parameters are required.
  const CatBreed({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.countryCodes,
    required this.countryCode,
    required this.description,
    required this.lifeSpan,
    required this.altNames,
    required this.wikipediaUrl,
    required this.indoor,
    required this.lap,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.experimental,
    required this.hairless,
    required this.natural,
    required this.rare,
    required this.rex,
    required this.suppressedTail,
    required this.shortLegs,
    required this.hypoallergenic,
    required this.image,
  });

  /// Creates a [CatBreed] from a JSON map.
  ///
  /// This factory method uses the generated `_$CatBreedFromJson` function from
  /// the `json_serializable` package to deserialize the JSON data into a
  /// `CatBreed` object.
  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  /// The unique identifier of the cat breed.
  final String id;

  /// The name of the cat breed.
  final String name;

  /// A description of the breed's temperament.
  final String temperament;

  /// The geographical origin of the breed.
  final String origin;

  /// A list of country codes where the breed is common.
  final String? countryCodes;

  /// The primary country code associated with the breed.
  final String? countryCode;

  /// A general description of the breed.
  final String description;

  /// The typical lifespan of the breed in years.
  final String? lifeSpan;

  /// Alternative names for the breed.
  final String? altNames;

  /// The URL to the Wikipedia page for this breed.
  final String? wikipediaUrl;

  /// A rating (0-5) indicating the breed's suitability for indoor living.
  final int? indoor;

  /// A rating (0-5) indicating the breed's tendency to be a lap cat.
  final int? lap;

  /// A rating (0-5) indicating the breed's adaptability to new environments.
  final int? adaptability;

  /// A rating (0-5) indicating the breed's affection level.
  final int? affectionLevel;

  /// A rating (0-5) indicating the breed's friendliness towards children.
  final int? childFriendly;

  /// A rating (0-5) indicating the breed's friendliness towards dogs.
  final int? dogFriendly;

  /// A rating (0-5) indicating the breed's energy level.
  final int? energyLevel;

  /// A rating (0-5) indicating the breed's grooming needs.
  final int? grooming;

  /// A rating (0-5) indicating the breed's susceptibility to health issues.
  final int? healthIssues;

  /// A rating (0-5) indicating the breed's intelligence.
  final int? intelligence;

  /// A rating (0-5) indicating the breed's shedding level.
  final int? sheddingLevel;

  /// A rating (0-5) indicating the breed's social needs.
  final int? socialNeeds;

  /// A rating (0-5) indicating the breed's friendliness towards strangers.
  final int? strangerFriendly;

  /// A rating (0-5) indicating the breed's vocalization tendency.
  final int? vocalisation;

  /// Whether the breed is considered experimental (1 or 0).
  final int? experimental;

  /// Whether the breed is hairless (1 or 0).
  final int? hairless;

  /// Whether the breed is considered natural (1 or 0).
  final int? natural;

  /// Whether the breed is considered rare (1 or 0).
  final int? rare;

  /// Whether the breed has a rex coat type (1 or 0).
  final int? rex;

  /// Whether the breed has a suppressed tail (1 or 0).
  final int? suppressedTail;

  /// Whether the breed has short legs (1 or 0).
  final int? shortLegs;

  /// Whether the breed is considered hypoallergenic (1 or 0).
  final int? hypoallergenic;

  ///Image of the cat breed
  final CatImage? image;
}
