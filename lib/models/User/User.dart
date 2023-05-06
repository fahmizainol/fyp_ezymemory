// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'User.freezed.dart';
part 'User.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String email,
    required double currentPoints,
    required List<String> deckList,
    required List<String> badgeList,
    required bool checkInToday,
    required String userStatsId,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}