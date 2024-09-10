part of 'cat_breeds_overview_bloc.dart';

/// Represents events that can occur in the cat breeds overview.

sealed class CatBreedsOverviewEvent extends Equatable {
  /// Base constructor for `CatBreedsOverviewEvent`.
  const CatBreedsOverviewEvent();

  /// Overrides the `props` getter from `Equatable` to define the properties
  /// used for equality comparison
  @override
  List<Object?> get props => [];
}

/// An event to trigger fetching cat breed data, optionally with a search query.

final class CatBreedsGetData extends CatBreedsOverviewEvent {
  /// Constructs a `CatBreedsGetData` event.
  ///
  /// [search] is an optional search query to filter the cat breeds.
  const CatBreedsGetData([this.search]);

  /// The search query to filter the cat breeds (optional).
  final String? search;

  /// Overrides the `props` getter from `Equatable`
  /// to define the properties used for equality comparison
  @override
  List<Object?> get props => [search];
}
