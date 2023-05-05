// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      currentPoints: (json['currentPoints'] as num).toDouble(),
      deckList:
          (json['deckList'] as List<dynamic>).map((e) => e as String).toList(),
      badgeList:
          (json['badgeList'] as List<dynamic>).map((e) => e as String).toList(),
      checkInToday: json['checkInToday'] as bool,
      userStatsId: json['userStatsId'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'currentPoints': instance.currentPoints,
      'deckList': instance.deckList,
      'badgeList': instance.badgeList,
      'checkInToday': instance.checkInToday,
      'userStatsId': instance.userStatsId,
    };
