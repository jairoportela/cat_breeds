part of 'cat_breeds_overview_bloc.dart';

enum CatBreedsOverviewStatus {
  initial,
  loading,
  success,
  notFoundItems,
  failure
}

class CatBreedsOverviewState extends Equatable {
  const CatBreedsOverviewState({
    this.status = CatBreedsOverviewStatus.initial,
    this.items = const [],
    this.search,
    this.message,
  });

  final String? search;
  final List<CatBreedModel> items;
  final CatBreedsOverviewStatus status;
  final String? message;

  CatBreedsOverviewState copyWith({
    String? Function()? search,
    List<CatBreedModel>? items,
    CatBreedsOverviewStatus? status,
    String? Function()? message,
  }) {
    return CatBreedsOverviewState(
      search: search != null ? search() : this.search,
      message: message != null ? message() : this.message,
      items: items ?? this.items,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [search, items, status, message];
}
