import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds/breeds/presentation/widgets/cat_breeds_list_view.dart';
import 'package:flutter/material.dart';
import 'package:the_cat_api/the_cat_api.dart';

class CatBreedsListScreen extends StatelessWidget {
  const CatBreedsListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TheCatApi.build().getCatBreeds(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!
                .map(
                  (e) => CatBreedModel.fromRepository(e),
                )
                .toList();
            return Scaffold(body: CatBreedsListView(data: data));
          } else {
            return const CircularProgressIndicator.adaptive();
          }
        },
      ),
    );
  }
}
