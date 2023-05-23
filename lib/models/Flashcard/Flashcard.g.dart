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
      repetitions: json['repetitions'] as int,
      interval: json['interval'] as int,
      reviewTime: const TimestampSerializer().fromJson(json['reviewTime']),
      easeFactor: (json['easeFactor'] as num).toDouble(),
      inUserStack: json['inUserStack'] as bool,
    );

Map<String, dynamic> _$$_FlashcardToJson(_$_Flashcard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'front': instance.front,
      'back': instance.back,
      'status': instance.status,
      'repetitions': instance.repetitions,
      'interval': instance.interval,
      'reviewTime': const TimestampSerializer().toJson(instance.reviewTime),
      'easeFactor': instance.easeFactor,
      'inUserStack': instance.inUserStack,
    };
