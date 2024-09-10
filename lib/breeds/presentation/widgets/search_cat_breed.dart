import 'package:cat_breeds/breeds/providers/bloc/cat_breeds_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///A flutter search widget to search cat breeds
class SearchCatBreed extends StatefulWidget {
  /// Constructs a `SearchCatBreed` instance.
  const SearchCatBreed({
    super.key,
    this.onChanged,
  });

  ///Action when a value change in the search text field
  final ValueChanged<String>? onChanged;

  @override
  State<SearchCatBreed> createState() => _SearchCatBreedState();
}

class _SearchCatBreedState extends State<SearchCatBreed> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatBreedsOverviewBloc, CatBreedsOverviewState>(
      listener: (context, state) {
        _controller.clear();
      },
      listenWhen: (previous, current) =>
          previous.status == CatBreedsOverviewStatus.notFoundItems &&
          current.status == CatBreedsOverviewStatus.loading,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search by breed',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: widget.onChanged,
        onSubmitted: (value) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
