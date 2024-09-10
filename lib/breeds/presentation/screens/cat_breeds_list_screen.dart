import 'package:cat_breeds/breeds/presentation/widgets/cat_breeds_list_view.dart';
import 'package:cat_breeds/breeds/presentation/widgets/error_list_widget.dart';
import 'package:cat_breeds/breeds/presentation/widgets/search_cat_breed.dart';
import 'package:cat_breeds/breeds/providers/bloc/cat_breeds_overview_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Construct a the cat breeds screen with a list view and a search bar
class CatBreedsListScreen extends StatelessWidget {
  /// Constructs a `CatBreedsListScreen` instance.
  const CatBreedsListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: SearchCatBreed(
          onChanged: (value) {
            context.read<CatBreedsOverviewBloc>().add(
                  CatBreedsGetData(value),
                );
          },
        ),
      ),
      body: BlocBuilder<CatBreedsOverviewBloc, CatBreedsOverviewState>(
        builder: (context, state) {
          final status = state.status;
          return switch (status) {
            CatBreedsOverviewStatus.initial ||
            CatBreedsOverviewStatus.loading =>
              const Center(child: CircularProgressIndicator.adaptive()),
            CatBreedsOverviewStatus.success =>
              CatBreedsListView(data: state.items),
            CatBreedsOverviewStatus.notFoundItems => ErrorListWidget(
                onPressed: () {
                  context
                      .read<CatBreedsOverviewBloc>()
                      .add(const CatBreedsGetData(''));
                },
                message: state.message ?? '',
              ),
            CatBreedsOverviewStatus.failure => ErrorListWidget(
                onPressed: () {
                  context
                      .read<CatBreedsOverviewBloc>()
                      .add(const CatBreedsGetData());
                },
                message: state.message ?? '',
              ),
          };
        },
      ),
    );
  }
}
