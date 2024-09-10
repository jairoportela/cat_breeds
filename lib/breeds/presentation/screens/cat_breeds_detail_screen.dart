import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds/breeds/presentation/widgets/cat_breed_datail_info.dart';
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
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          Expanded(
            child: CatBreedDetailInfo.fromBreed(
              breed: breed,
            ),
          ),
        ],
      ),
    );
  }
}
