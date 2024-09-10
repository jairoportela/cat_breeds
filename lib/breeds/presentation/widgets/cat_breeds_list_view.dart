import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds/breeds/presentation/screens/cat_breeds_detail_screen.dart';
import 'package:flutter/material.dart';

class CatBreedsListView extends StatelessWidget {
  const CatBreedsListView({
    super.key,
    required this.data,
  });

  final List<CatBreedModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data.elementAt(index);

        return Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => CatBreedDetail(breed: item)));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(item.name),
                    if (item.imageIsNotEmpty)
                      Hero(
                        tag: item.imageId!,
                        child: Image.network(
                          item.imageUrl!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    Text(item.countryName)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
