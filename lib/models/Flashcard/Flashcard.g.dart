// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Flashcard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Flashcard _$$_FlashcardFromJson(Map<String, dynamic> json) => _$_Flashcard(
      id: json['id'] as String,
      front: json['front'] as String,
      back: json['back'] as String,
      status: json['status'] as String,
      quality: json['quality'] as int,
      repetition: json['repetition'] as int,
      previousInterval: json['previousInterval'] as int,
      easeFactor: (json['easeFactor'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FlashcardToJson(_$_Flashcard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'front': instance.front,
      'back': instance.back,
      'status': instance.status,
      'quality': instance.quality,
      'repetition': instance.repetition,
      'previousInterval': instance.previousInterval,
      'easeFactor': instance.easeFactor,
    };
