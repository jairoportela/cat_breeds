part of 'cat_breeds_overview_bloc.dart';

enum CatBreedsOverviewStatus { initial, loading, success, failure }

class CatBreedsOverviewState extends Equatable {
  const CatBreedsOverviewState({
    this.status = CatBreedsOverviewStatus.initial,
    this.items = const [],
    this.search,
  });

  final String? search;
  final List<CatBreedModel> items;
  final CatBreedsOverviewStatus status;

  CatBreedsOverviewState copyWith({
    String? Function()? search,
    List<CatBreedModel>? items,
    CatBreedsOverviewStatus? status,
  }) {
    return CatBreedsOverviewState(
      search: search != null ? search() : this.search,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [search, items, status];
}
