import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cat_facts/api/cat_fact_repository.dart';
import 'package:cat_facts/data/cat_fact.dart';
import 'package:cat_facts/model/fact_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'cat_fact_state.dart';

part 'cat_fact_bloc.freezed.dart';

enum CatFactEvent { getFact }

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  final CatFactRepository _repo;
  final CatFactService catFactService;
  final Box catFactBox;

  Uint8List? image;

  CatFactBloc(this._repo, this.catFactService, this.catFactBox)
      : super(CatFactState.initial()) {
    on<CatFactEvent>((event, emit) async {
      if (event == CatFactEvent.getFact) {
        emit(state.copyWith(loading: true)); // emit loading state
        final catFact = await catFactService.getRandomFact();
        image = await _repo.fetchCatImage();
        catFactBox.add(FactHistory(catFact.fact, DateTime.now()));
        emit(state.copyWith(loading: false, cat: catFact)); // emit loaded state
      }
    });

    add(CatFactEvent
        .getFact); // Add an initial event to load a fact and an image
  }
}
