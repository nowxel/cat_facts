import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cat_facts/api/cat_fact_repository.dart';
import 'package:cat_facts/data/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_fact_state.dart';
part 'cat_fact_cubit.freezed.dart';

class CatFactCubit extends Cubit<CatFactState> {
  CatFactCubit(this._repo, this.catFactService) : super(CatFactState.initial());
  final CatFactRepository _repo;
  final CatFactService catFactService;


  Uint8List? image;

  Future<void> fetchRandomFact() async {
    emit(state.copyWith(loading: true));

    final catFact = await catFactService.getRandomFact();
    image = await _repo.fetchCatImage();

    emit(state.copyWith(loading: false, cat: catFact));
  }
}
