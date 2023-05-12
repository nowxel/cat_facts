import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_image.freezed.dart';

part 'cat_image.g.dart';

@freezed
class CatImage with _$CatImage {
  const factory CatImage({
    required String image,
  }) = _CatImage;

  factory CatImage.fromJson(Map<String, dynamic> json) =>
      _$CatImageFromJson(json);

  factory CatImage.empty() => const _CatImage(
        image: '',
      );
}
