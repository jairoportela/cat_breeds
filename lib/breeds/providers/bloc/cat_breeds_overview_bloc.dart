import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:cat_breeds_repository/cat_breeds_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'cat_breeds_overview_event.dart';
part 'cat_breeds_overview_state.dart';

/// An `EventTransformer` that combines debouncing and droppable behavior
/// for `CatBreedsOverviewEvent`s.

/// [duration] specifies the debounce time.
///
/// It debounces events by the specified duration and then applies
/// droppable behavior, ensuring that only the latest event within the
/// debounce window is processed.
EventTransformer<CatBreedsOverviewEvent>
    debounceDroppable<CatBreedsOverviewEvent>(Duration duration) {
  return (events, mapper) => droppable<CatBreedsOverviewEvent>()
      .call(events.debounceTime(duration), mapper);
}

/// A BLoC (Business Logic Component) responsible for managing the state of
/// the cat breeds overview.
class CatBreedsOverviewBloc
    extends Bloc<CatBreedsOverviewEvent, CatBreedsOverviewState> {
  /// Constructs a `CatBreedsOverviewBloc` instance.
  ///
  /// [_repository] is the repository used to fetch cat breed data.
  /// The initial state is set to a default `CatBreedsOverviewState`.
  /// It listens for `CatBreedsGetData` events and
  /// applies the `debounceDroppable` transformer
  CatBreedsOverviewBloc(this._repository)
      : super(const CatBreedsOverviewState()) {
    on<CatBreedsGetData>(
      _getData,
      transformer: debounceDroppable(
        const Duration(milliseconds: 300),
      ),
    );
  }

  /// Handles the `CatBreedsGetData` event.
  ///
  /// Fetches cat breed data from the repository based on the search query
  /// (or the current state's search if not provided).
  /// Emits states to update the UI based on the result:
  /// - `CatBreedsOverviewStatus.loading` while fetching data.
  /// - `CatBreedsOverviewStatus.success` with the fetched cat breeds if
  /// successful.
  /// - `CatBreedsOverviewStatus.notFoundItems` if no cat breeds are found.
  /// - `CatBreedsOverviewStatus.failure` if an error occurs.
  Future<void> _getData(
    CatBreedsGetData event,
    Emitter<CatBreedsOverviewState> emit,
  ) async {
    final search = event.search ?? state.search;
    try {
      emit(
        state.copyWith(
          status: CatBreedsOverviewStatus.loading,
          message: () => null,
        ),
      );
      final result = await _repository.getCatBreeds(search);
      emit(
        state.copyWith(
          status: CatBreedsOverviewStatus.success,
          items: result.map(CatBreedModel.fromRepository).toList(),
          search: () => search,
          message: () => null,
        ),
      );
    } on CatBreedsNotFoundFailure {
      emit(
        state.copyWith(
          status: CatBreedsOverviewStatus.notFoundItems,
          search: () => search,
          items: [],
          message: () =>
              'Sorry, there are not results for your search, try again.',
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: CatBreedsOverviewStatus.failure,
          search: () => search,
          message: () => 'An error ocurrs, try again.',
        ),
      );
    }
  }

  /// The repository used to fetch cat breed data
  final CatBreedsRepository _repository;
}
