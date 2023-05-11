// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cat_fact_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatFactState {
  bool get loading => throw _privateConstructorUsedError;
  CatFact get cat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatFactStateCopyWith<CatFactState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatFactStateCopyWith<$Res> {
  factory $CatFactStateCopyWith(
          CatFactState value, $Res Function(CatFactState) then) =
      _$CatFactStateCopyWithImpl<$Res, CatFactState>;
  @useResult
  $Res call({bool loading, CatFact cat});

  $CatFactCopyWith<$Res> get cat;
}

/// @nodoc
class _$CatFactStateCopyWithImpl<$Res, $Val extends CatFactState>
    implements $CatFactStateCopyWith<$Res> {
  _$CatFactStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cat = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cat: null == cat
          ? _value.cat
          : cat // ignore: cast_nullable_to_non_nullable
              as CatFact,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CatFactCopyWith<$Res> get cat {
    return $CatFactCopyWith<$Res>(_value.cat, (value) {
      return _then(_value.copyWith(cat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CatFactStateCopyWith<$Res>
    implements $CatFactStateCopyWith<$Res> {
  factory _$$_CatFactStateCopyWith(
          _$_CatFactState value, $Res Function(_$_CatFactState) then) =
      __$$_CatFactStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, CatFact cat});

  @override
  $CatFactCopyWith<$Res> get cat;
}

/// @nodoc
class __$$_CatFactStateCopyWithImpl<$Res>
    extends _$CatFactStateCopyWithImpl<$Res, _$_CatFactState>
    implements _$$_CatFactStateCopyWith<$Res> {
  __$$_CatFactStateCopyWithImpl(
      _$_CatFactState _value, $Res Function(_$_CatFactState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? cat = null,
  }) {
    return _then(_$_CatFactState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cat: null == cat
          ? _value.cat
          : cat // ignore: cast_nullable_to_non_nullable
              as CatFact,
    ));
  }
}

/// @nodoc

class _$_CatFactState implements _CatFactState {
  const _$_CatFactState({required this.loading, required this.cat});

  @override
  final bool loading;
  @override
  final CatFact cat;

  @override
  String toString() {
    return 'CatFactState(loading: $loading, cat: $cat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatFactState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.cat, cat) || other.cat == cat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, cat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatFactStateCopyWith<_$_CatFactState> get copyWith =>
      __$$_CatFactStateCopyWithImpl<_$_CatFactState>(this, _$identity);
}

abstract class _CatFactState implements CatFactState {
  const factory _CatFactState(
      {required final bool loading,
      required final CatFact cat}) = _$_CatFactState;

  @override
  bool get loading;
  @override
  CatFact get cat;
  @override
  @JsonKey(ignore: true)
  _$$_CatFactStateCopyWith<_$_CatFactState> get copyWith =>
      throw _privateConstructorUsedError;
}
