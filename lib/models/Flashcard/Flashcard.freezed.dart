// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Flashcard _$FlashcardFromJson(Map<String, dynamic> json) {
  return _Flashcard.fromJson(json);
}

/// @nodoc
mixin _$Flashcard {
  String get id => throw _privateConstructorUsedError;
  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get repetitions => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  @TimestampSerializer()
  DateTime get reviewTime => throw _privateConstructorUsedError;
  double get easeFactor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res, Flashcard>;
  @useResult
  $Res call(
      {String id,
      String front,
      String back,
      String status,
      int repetitions,
      int interval,
      @TimestampSerializer() DateTime reviewTime,
      double easeFactor});
}

/// @nodoc
class _$FlashcardCopyWithImpl<$Res, $Val extends Flashcard>
    implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
    Object? status = null,
    Object? repetitions = null,
    Object? interval = null,
    Object? reviewTime = null,
    Object? easeFactor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      reviewTime: null == reviewTime
          ? _value.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlashcardCopyWith<$Res> implements $FlashcardCopyWith<$Res> {
  factory _$$_FlashcardCopyWith(
          _$_Flashcard value, $Res Function(_$_Flashcard) then) =
      __$$_FlashcardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String front,
      String back,
      String status,
      int repetitions,
      int interval,
      @TimestampSerializer() DateTime reviewTime,
      double easeFactor});
}

/// @nodoc
class __$$_FlashcardCopyWithImpl<$Res>
    extends _$FlashcardCopyWithImpl<$Res, _$_Flashcard>
    implements _$$_FlashcardCopyWith<$Res> {
  __$$_FlashcardCopyWithImpl(
      _$_Flashcard _value, $Res Function(_$_Flashcard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? front = null,
    Object? back = null,
    Object? status = null,
    Object? repetitions = null,
    Object? interval = null,
    Object? reviewTime = null,
    Object? easeFactor = null,
  }) {
    return _then(_$_Flashcard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      front: null == front
          ? _value.front
          : front // ignore: cast_nullable_to_non_nullable
              as String,
      back: null == back
          ? _value.back
          : back // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      repetitions: null == repetitions
          ? _value.repetitions
          : repetitions // ignore: cast_nullable_to_non_nullable
              as int,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      reviewTime: null == reviewTime
          ? _value.reviewTime
          : reviewTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      easeFactor: null == easeFactor
          ? _value.easeFactor
          : easeFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Flashcard with DiagnosticableTreeMixin implements _Flashcard {
  const _$_Flashcard(
      {required this.id,
      required this.front,
      required this.back,
      required this.status,
      required this.repetitions,
      required this.interval,
      @TimestampSerializer() required this.reviewTime,
      required this.easeFactor});

  factory _$_Flashcard.fromJson(Map<String, dynamic> json) =>
      _$$_FlashcardFromJson(json);

  @override
  final String id;
  @override
  final String front;
  @override
  final String back;
  @override
  final String status;
  @override
  final int repetitions;
  @override
  final int interval;
  @override
  @TimestampSerializer()
  final DateTime reviewTime;
  @override
  final double easeFactor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Flashcard(id: $id, front: $front, back: $back, status: $status, repetitions: $repetitions, interval: $interval, reviewTime: $reviewTime, easeFactor: $easeFactor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Flashcard'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('front', front))
      ..add(DiagnosticsProperty('back', back))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('repetitions', repetitions))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('reviewTime', reviewTime))
      ..add(DiagnosticsProperty('easeFactor', easeFactor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flashcard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.repetitions, repetitions) ||
                other.repetitions == repetitions) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.reviewTime, reviewTime) ||
                other.reviewTime == reviewTime) &&
            (identical(other.easeFactor, easeFactor) ||
                other.easeFactor == easeFactor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, front, back, status,
      repetitions, interval, reviewTime, easeFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      __$$_FlashcardCopyWithImpl<_$_Flashcard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlashcardToJson(
      this,
    );
  }
}

abstract class _Flashcard implements Flashcard {
  const factory _Flashcard(
      {required final String id,
      required final String front,
      required final String back,
      required final String status,
      required final int repetitions,
      required final int interval,
      @TimestampSerializer() required final DateTime reviewTime,
      required final double easeFactor}) = _$_Flashcard;

  factory _Flashcard.fromJson(Map<String, dynamic> json) =
      _$_Flashcard.fromJson;

  @override
  String get id;
  @override
  String get front;
  @override
  String get back;
  @override
  String get status;
  @override
  int get repetitions;
  @override
  int get interval;
  @override
  @TimestampSerializer()
  DateTime get reviewTime;
  @override
  double get easeFactor;
  @override
  @JsonKey(ignore: true)
  _$$_FlashcardCopyWith<_$_Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}
