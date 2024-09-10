import 'package:cat_breeds_repository/cat_breeds_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_breeds/breeds/data/models/cat_breed.dart';
import 'package:equatable/equatable.dart';

part 'cat_breeds_overview_event.dart';
part 'cat_breeds_overview_state.dart';

class CatBreedsOverviewBloc
    extends Bloc<CatBreedsOverviewEvent, CatBreedsOverviewState> {
  CatBreedsOverviewBloc(this._repository)
      : super(const CatBreedsOverviewState()) {
    on<CatBreedsGetData>(_getData);
  }

  void _getData(
      CatBreedsGetData event, Emitter<CatBreedsOverviewState> emit) async {
    try {
      emit(state.copyWith(status: CatBreedsOverviewStatus.loading, items: []));
      final result = await _repository.getCatBreeds(event.search);
      emit(state.copyWith(
        status: CatBreedsOverviewStatus.success,
        items: result.map(CatBreedModel.fromRepository).toList(),
      ));
    } catch (error) {
      emit(
        state.copyWith(status: CatBreedsOverviewStatus.failure),
      );
    }
  }

  final CatBreedsRepository _repository;
}
