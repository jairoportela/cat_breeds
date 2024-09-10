part of 'cat_breeds_overview_bloc.dart';

/// Represents the possible states of the cat breeds overview.

enum CatBreedsOverviewStatus {
  /// The initial state before any data fetching or actions.
  initial,

  /// Data is being loaded or an action is in progress.
  loading,

  /// Data has been successfully fetched and is available.
  success,

  /// No items were found matching the search criteria.
  notFoundItems,

  /// An error occurred during data fetching or an action.
  failure
}

/// Represents the state of the cat breeds overview screen.

class CatBreedsOverviewState extends Equatable {
  /// Constructs a `CatBreedsOverviewState` instance.

  /// [status] defaults to `CatBreedsOverviewStatus.initial`
  /// [items] defaults to an empty list
  const CatBreedsOverviewState({
    this.status = CatBreedsOverviewStatus.initial,
    this.items = const [],
    this.search,
    this.message,
  });

  /// The current search query (optional).
  final String? search;

  /// The list of `CatBreedModel` objects representing the cat breeds.
  final List<CatBreedModel> items;

  /// The current status of the cat breeds overview.
  final CatBreedsOverviewStatus status;

  /// An optional message associated with the current state
  ///  (e.g., an error message).
  final String? message;

  /// Creates a copy of the current `CatBreedsOverviewState` with the
  /// specified modifications.
  ///
  /// Allows for optionally updating the [search] and [message] using functions,
  /// while [items] and [status] can be directly replaced.
  /// If no new values are provided, the existing values are retained.
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

  /// Overrides the `props` getter from `Equatable` to define the properties
  /// used for equality comparison
  @override
  List<Object?> get props => [search, items, status, message];
}
