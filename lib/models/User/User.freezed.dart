// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'User.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  double get currentPoints => throw _privateConstructorUsedError;
  List<String> get badgeList => throw _privateConstructorUsedError;
  bool get checkInToday => throw _privateConstructorUsedError;
  String get userStatsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String username,
      String email,
      double currentPoints,
      List<String> badgeList,
      bool checkInToday,
      String userStatsId});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? currentPoints = null,
    Object? badgeList = null,
    Object? checkInToday = null,
    Object? userStatsId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currentPoints: null == currentPoints
          ? _value.currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as double,
      badgeList: null == badgeList
          ? _value.badgeList
          : badgeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      checkInToday: null == checkInToday
          ? _value.checkInToday
          : checkInToday // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatsId: null == userStatsId
          ? _value.userStatsId
          : userStatsId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String email,
      double currentPoints,
      List<String> badgeList,
      bool checkInToday,
      String userStatsId});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? currentPoints = null,
    Object? badgeList = null,
    Object? checkInToday = null,
    Object? userStatsId = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      currentPoints: null == currentPoints
          ? _value.currentPoints
          : currentPoints // ignore: cast_nullable_to_non_nullable
              as double,
      badgeList: null == badgeList
          ? _value._badgeList
          : badgeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      checkInToday: null == checkInToday
          ? _value.checkInToday
          : checkInToday // ignore: cast_nullable_to_non_nullable
              as bool,
      userStatsId: null == userStatsId
          ? _value.userStatsId
          : userStatsId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.id,
      required this.username,
      required this.email,
      required this.currentPoints,
      required final List<String> badgeList,
      required this.checkInToday,
      required this.userStatsId})
      : _badgeList = badgeList;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final double currentPoints;
  final List<String> _badgeList;
  @override
  List<String> get badgeList {
    if (_badgeList is EqualUnmodifiableListView) return _badgeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badgeList);
  }

  @override
  final bool checkInToday;
  @override
  final String userStatsId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, username: $username, email: $email, currentPoints: $currentPoints, badgeList: $badgeList, checkInToday: $checkInToday, userStatsId: $userStatsId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('currentPoints', currentPoints))
      ..add(DiagnosticsProperty('badgeList', badgeList))
      ..add(DiagnosticsProperty('checkInToday', checkInToday))
      ..add(DiagnosticsProperty('userStatsId', userStatsId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.currentPoints, currentPoints) ||
                other.currentPoints == currentPoints) &&
            const DeepCollectionEquality()
                .equals(other._badgeList, _badgeList) &&
            (identical(other.checkInToday, checkInToday) ||
                other.checkInToday == checkInToday) &&
            (identical(other.userStatsId, userStatsId) ||
                other.userStatsId == userStatsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      currentPoints,
      const DeepCollectionEquality().hash(_badgeList),
      checkInToday,
      userStatsId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      required final String username,
      required final String email,
      required final double currentPoints,
      required final List<String> badgeList,
      required final bool checkInToday,
      required final String userStatsId}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  double get currentPoints;
  @override
  List<String> get badgeList;
  @override
  bool get checkInToday;
  @override
  String get userStatsId;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
