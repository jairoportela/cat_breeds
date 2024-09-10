import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds/breeds/presentation/widgets/cat_breed_datail_info.dart';
import 'package:flutter/material.dart';

///Flutter screen for show the detail of a cat breed
///
///needs the [breed] model
class CatBreedDetail extends StatelessWidget {
  /// Constructs a `CatBreedDetail` instance.
  const CatBreedDetail({
    required this.breed,
    super.key,
  });

  ///Cat breed model
  final CatBreedModel breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final imageHeight = constraints.maxHeight / 2;

          return Column(
            children: [
              if (breed.imageId != null && breed.imageUrl != null)
                Hero(
                  tag: breed.imageId!,
                  child: Image.network(
                    breed.imageUrl!,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              Expanded(
                child: CatBreedDetailInfo.fromBreed(
                  breed: breed,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
