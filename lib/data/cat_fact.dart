import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_fact.freezed.dart';

part 'cat_fact.g.dart';

@freezed
class CatFact with _$CatFact {
  const factory CatFact({
    required String fact,
  }) = _CatFact;

  factory CatFact.fromJson(Map<String, dynamic> json) => _$CatFactFromJson(json);

  factory CatFact.empty() => const _CatFact(
        fact: '',
      );
}
