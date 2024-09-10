import 'package:flutter/material.dart';
import 'package:cat_breeds/breeds/data/models/cat_breed.dart';

class CatBreedDetailInfo extends StatefulWidget {
  const CatBreedDetailInfo({
    super.key,
    required this.country,
    required this.intelligence,
    required this.adaptability,
    required this.description,
    required this.lifespan,
  });
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

  final String country;
  final int intelligence;
  final int adaptability;
  final String description;
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
                    Icons.favorite_border), // You can choose a suitable icon
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
