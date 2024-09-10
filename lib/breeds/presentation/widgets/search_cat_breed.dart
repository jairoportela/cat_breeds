import 'package:cat_breeds/breeds/providers/bloc/cat_breeds_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCatBreed extends StatefulWidget {
  const SearchCatBreed({
    super.key,
    this.onChanged,
  });
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
        if (_controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      listenWhen: (previous, current) => current.search?.isEmpty == true,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.blueGrey.shade100,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
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
