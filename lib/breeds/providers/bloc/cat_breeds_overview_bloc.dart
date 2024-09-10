import 'package:cat_breeds_repository/cat_breeds_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'cat_breeds_overview_event.dart';
part 'cat_breeds_overview_state.dart';

EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).asyncExpand(mapper);
}

class CatBreedsOverviewBloc
    extends Bloc<CatBreedsOverviewEvent, CatBreedsOverviewState> {
  CatBreedsOverviewBloc(this._repository)
      : super(const CatBreedsOverviewState()) {
    on<CatBreedsGetData>(
      _getData,
      transformer: debounceSequential(
        const Duration(milliseconds: 300),
      ),
    );
  }

  void _getData(
      CatBreedsGetData event, Emitter<CatBreedsOverviewState> emit) async {
    final search = event.search ?? state.search;
    try {
      emit(state.copyWith(
        status: CatBreedsOverviewStatus.loading,
        message: () => null,
      ));
      final result = await _repository.getCatBreeds(search);
      emit(state.copyWith(
        status: CatBreedsOverviewStatus.success,
        items: result.map(CatBreedModel.fromRepository).toList(),
        search: () => search,
        message: () => null,
      ));
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

  final CatBreedsRepository _repository;
}
