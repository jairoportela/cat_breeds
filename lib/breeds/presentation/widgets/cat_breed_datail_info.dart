import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:flutter/material.dart';

///Scroll detail info for a cat breed
class CatBreedDetailInfo extends StatefulWidget {
  /// Constructs a `CatBreedDetailInfo` instance.
  const CatBreedDetailInfo({
    required this.country,
    required this.intelligence,
    required this.adaptability,
    required this.description,
    required this.lifespan,
    super.key,
  });

  /// Constructs a `CatBreedDetailInfo` instance from a [breed].
  factory CatBreedDetailInfo.fromBreed({required CatBreedModel breed}) {
    final CatBreedModel(
      :adaptability,
      :intelligence,
      :description,
      :countryName,
      :lifeSpan,
    ) = breed;
    return CatBreedDetailInfo(
      country: countryName,
      intelligence: intelligence ?? 0,
      adaptability: adaptability ?? 0,
      description: description,
      lifespan: lifeSpan,
    );
  }

  /// The name of the country where the cat breed originated.
  final String country;

  /// The intelligence level of the cat breed.
  final int intelligence;

  /// The adaptability level of the cat breed.
  final int adaptability;

  ///Descrip
  final String description;

  /// The life span of the cat breed (optional).
  final String? lifespan;
  @override
  State<CatBreedDetailInfo> createState() => _CatBreedDetailInfoState();
}

class _CatBreedDetailInfoState extends State<CatBreedDetailInfo> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      controller: _controller,
      child: ListView(
        controller: _controller,
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Text(
                'Country: ${widget.country}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.lightbulb_outline),
              const SizedBox(width: 5),
              Text('Intelligence: ${widget.intelligence}/5'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.house_outlined),
              const SizedBox(width: 5),
              Text('Adaptability: ${widget.adaptability}/5'),
            ],
          ),
          const SizedBox(height: 8),
          if (widget.lifespan != null)
            Row(
              children: [
                const Icon(
                  Icons.favorite_border,
                ), // You can choose a suitable icon
                const SizedBox(width: 5),
                Text('Lifespan: ${widget.lifespan}'),
              ],
            ),
          const SizedBox(height: 16),
          const Text(
            'Description:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(widget.description),
        ],
      ),
    );
  }
}
