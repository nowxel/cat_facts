import 'package:bloc/bloc.dart';
import 'package:cat_facts/data/cat_image_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_image_cubit.freezed.dart';
part 'cat_image_state.dart';

class CatImageCubit extends Cubit<CatImageState> {
  CatImageCubit(this._repo) : super (CatImageState.initial());
  final CatImageRepository _repo;

  Future<void> fetchRandomImage() async {
    emit(state.copyWith(loading: true));

    final catImage = await _repo.fetchRandomImage();

    emit(state.copyWith(loading: false, image: catImage));
  }
}