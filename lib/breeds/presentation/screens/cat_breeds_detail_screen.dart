import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:flutter/material.dart';

class CatBreedDetail extends StatelessWidget {
  const CatBreedDetail({super.key, required this.breed});
  final CatBreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: Column(
        children: [
          if (breed.imageId != null && breed.imageUrl != null)
            Hero(
              tag: breed.imageId!,
              child: Image.network(
                breed.imageUrl!,
              ),
            ),
          Expanded(
              child: CatBreedDatailInfo(
            breed: breed,
          )),
        ],
      ),
    );
  }
}

class CatBreedDatailInfo extends StatefulWidget {
  const CatBreedDatailInfo({super.key, required this.breed});
  final CatBreedModel breed;
  @override
  State<CatBreedDatailInfo> createState() => _CatBreedDatailInfoState();
}

class _CatBreedDatailInfoState extends State<CatBreedDatailInfo> {
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
        padding: const EdgeInsets.all(20),
        children: [
          Text(widget.breed.description),
          const SizedBox(height: 10),
          Text('Nombre pais: ${widget.breed.countryName}'),
          if (widget.breed.intelligence != null) ...[
            const SizedBox(height: 10),
            Text('Inteligencia: ${widget.breed.intelligence}')
          ],
          if (widget.breed.adaptability != null) ...[
            const SizedBox(height: 10),
            Text('Adaptabilidad: ${widget.breed.adaptability}')
          ]
        ],
      ),
    );
  }
}
