// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Deck _$$_DeckFromJson(Map<String, dynamic> json) => _$_Deck(
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      name: json['name'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      isShared: json['isShared'] as bool,
      category: json['category'] as String,
      flashcard: json['flashcard'] as String,
      lastFetchedTime: DateTime.parse(json['lastFetchedTime'] as String),
    );

Map<String, dynamic> _$$_DeckToJson(_$_Deck instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'createDate': instance.createDate.toIso8601String(),
      'isShared': instance.isShared,
      'category': instance.category,
      'flashcard': instance.flashcard,
      'lastFetchedTime': instance.lastFetchedTime.toIso8601String(),
    };
