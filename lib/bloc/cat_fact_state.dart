part of 'cat_fact_bloc.dart';

@freezed
class CatFactState with _$CatFactState {
  const factory CatFactState({
    required bool loading,
    required CatFact cat,
  }) = _CatFactState;

  factory CatFactState.initial() => _CatFactState(
        loading: false,
        cat: CatFact.empty(),
      );
}
