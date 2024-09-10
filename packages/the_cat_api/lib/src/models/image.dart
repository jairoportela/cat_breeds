import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

/// Represents an image of a cat.
///
/// This class is annotated with `@JsonSerializable()`, which allows it to be
/// easily serialized to and deserialized from JSON
/// using the `json_serializable` package.
@JsonSerializable()
class CatImage {
  /// Creates a [CatImage].
  ///
  /// All parameters are required.
  const CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  /// Creates a [CatImage] from a JSON map.
  ///
  /// This factory method uses the generated `_$CatImageFromJson` function from
  /// the `json_serializable` package to deserialize the JSON data into a
  /// `CatImage` object.
  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);

  /// The unique identifier of the cat image.
  final String id;

  /// The width of the cat image in pixels.
  final int width;

  /// The height of the cat image in pixels.
  final int height;

  /// The URL where the cat image can be accessed.
  final String url;
}
