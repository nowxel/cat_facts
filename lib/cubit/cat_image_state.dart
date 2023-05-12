part of 'cat_image_cubit.dart';

@freezed
class CatImageState with _$CatImageState {
  const factory CatImageState({
    required bool loading,
    required Uri image,
  }) = _CatImageState;

  factory CatImageState.initial() => _CatImageState(
    loading: false,
    image: Uri(),
  );
}
