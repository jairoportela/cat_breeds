part of 'cat_breeds_overview_bloc.dart';

sealed class CatBreedsOverviewEvent extends Equatable {
  const CatBreedsOverviewEvent();

  @override
  List<Object?> get props => [];
}

final class CatBreedsGetData extends CatBreedsOverviewEvent {
  const CatBreedsGetData([this.search]);

  final String? search;

  @override
  List<Object?> get props => [search];
}
