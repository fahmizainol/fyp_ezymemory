import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String username;
  final String email;
  final double currentPoints;
  final List<String> deckList;
  final List<String> badgeList;
  final bool checkInToday;
  final String userStatsId;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.currentPoints,
    required this.deckList,
    required this.badgeList,
    required this.checkInToday,
    required this.userStatsId,
  });

  User copyWith({
    String? id,
    String? username,
    String? email,
    double? currentPoints,
    List<String>? deckList,
    List<String>? badgeList,
    bool? checkInToday,
    String? userStats,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      currentPoints: currentPoints ?? this.currentPoints,
      deckList: deckList ?? this.deckList,
      badgeList: badgeList ?? this.badgeList,
      checkInToday: checkInToday ?? this.checkInToday,
      userStatsId: userStats ?? this.userStatsId,
    );
  }

  factory User.fromData(Map<String, dynamic> data) => User(
        id: data['id'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        currentPoints: data['currentPoints'] ?? 0.0,
        deckList: List<String>.from(data['deckList']) ?? [],
        badgeList: List<String>.from(data['badgeList']) ?? [],
        checkInToday: data['checkInToday'] ?? false,
        userStatsId: data['userStats'] ?? {},
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'currentPoints': currentPoints,
      'deckList': deckList,
      'badgeList': badgeList,
      'checkInToday': checkInToday,
      'userStats': userStatsId,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      currentPoints,
      deckList,
      badgeList,
      checkInToday,
      userStatsId,
    ];
  }
}
