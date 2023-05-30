// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Deck _$DeckFromJson(Map<String, dynamic> json) {
  return _Deck.fromJson(json);
}

/// @nodoc
mixin _$Deck {
  String get id => throw _privateConstructorUsedError;
  String get user_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createDate => throw _privateConstructorUsedError;
  bool get isShared => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get flashcard => throw _privateConstructorUsedError;
  DateTime get lastFetchedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeckCopyWith<Deck> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res, Deck>;
  @useResult
  $Res call(
      {String id,
      String user_id,
      String name,
      DateTime createDate,
      bool isShared,
      String category,
      String flashcard,
      DateTime lastFetchedTime});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res, $Val extends Deck>
    implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? name = null,
    Object? createDate = null,
    Object? isShared = null,
    Object? category = null,
    Object? flashcard = null,
    Object? lastFetchedTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as String,
      lastFetchedTime: null == lastFetchedTime
          ? _value.lastFetchedTime
          : lastFetchedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$$_DeckCopyWith(_$_Deck value, $Res Function(_$_Deck) then) =
      __$$_DeckCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String user_id,
      String name,
      DateTime createDate,
      bool isShared,
      String category,
      String flashcard,
      DateTime lastFetchedTime});
}

/// @nodoc
class __$$_DeckCopyWithImpl<$Res> extends _$DeckCopyWithImpl<$Res, _$_Deck>
    implements _$$_DeckCopyWith<$Res> {
  __$$_DeckCopyWithImpl(_$_Deck _value, $Res Function(_$_Deck) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? name = null,
    Object? createDate = null,
    Object? isShared = null,
    Object? category = null,
    Object? flashcard = null,
    Object? lastFetchedTime = null,
  }) {
    return _then(_$_Deck(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as String,
      lastFetchedTime: null == lastFetchedTime
          ? _value.lastFetchedTime
          : lastFetchedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Deck with DiagnosticableTreeMixin implements _Deck {
  const _$_Deck(
      {required this.id,
      required this.user_id,
      required this.name,
      required this.createDate,
      required this.isShared,
      required this.category,
      required this.flashcard,
      required this.lastFetchedTime});

  factory _$_Deck.fromJson(Map<String, dynamic> json) => _$$_DeckFromJson(json);

  @override
  final String id;
  @override
  final String user_id;
  @override
  final String name;
  @override
  final DateTime createDate;
  @override
  final bool isShared;
  @override
  final String category;
  @override
  final String flashcard;
  @override
  final DateTime lastFetchedTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Deck(id: $id, user_id: $user_id, name: $name, createDate: $createDate, isShared: $isShared, category: $category, flashcard: $flashcard, lastFetchedTime: $lastFetchedTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Deck'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('user_id', user_id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createDate', createDate))
      ..add(DiagnosticsProperty('isShared', isShared))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('flashcard', flashcard))
      ..add(DiagnosticsProperty('lastFetchedTime', lastFetchedTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deck &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard) &&
            (identical(other.lastFetchedTime, lastFetchedTime) ||
                other.lastFetchedTime == lastFetchedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user_id, name, createDate,
      isShared, category, flashcard, lastFetchedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeckCopyWith<_$_Deck> get copyWith =>
      __$$_DeckCopyWithImpl<_$_Deck>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeckToJson(
      this,
    );
  }
}

abstract class _Deck implements Deck {
  const factory _Deck(
      {required final String id,
      required final String user_id,
      required final String name,
      required final DateTime createDate,
      required final bool isShared,
      required final String category,
      required final String flashcard,
      required final DateTime lastFetchedTime}) = _$_Deck;

  factory _Deck.fromJson(Map<String, dynamic> json) = _$_Deck.fromJson;

  @override
  String get id;
  @override
  String get user_id;
  @override
  String get name;
  @override
  DateTime get createDate;
  @override
  bool get isShared;
  @override
  String get category;
  @override
  String get flashcard;
  @override
  DateTime get lastFetchedTime;
  @override
  @JsonKey(ignore: true)
  _$$_DeckCopyWith<_$_Deck> get copyWith => throw _privateConstructorUsedError;
}
