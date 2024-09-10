import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds/breeds/presentation/screens/cat_breeds_detail_screen.dart';
import 'package:flutter/material.dart';

///A flutter list view of the cat breeds data
class CatBreedsListView extends StatelessWidget {
  /// A constructor of the CatBreedsListView
  const CatBreedsListView({
    required this.data,
    super.key,
  });

  ///List of cat breed data
  final List<CatBreedModel> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data.elementAt(index);

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (ctx) => CatBreedDetail(breed: item),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (item.imageIsNotEmpty)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Hero(
                      tag: item.imageId!,
                      child: Image.network(
                        item.imageUrl!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Country: ${item.countryName}'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.lightbulb_outline),
                          const SizedBox(width: 5),
                          Text('Intelligence: ${item.intelligence}/5'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
