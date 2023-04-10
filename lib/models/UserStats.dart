class UserStats {
  final String userId;
  final String username;
  final String email;
  // final int points;
  // final List<Deck> deckList;
  // final List<Badge> badgeList;

  UserStats({
    required this.userId,
    required this.username,
    required this.email,
    // TODO: add more
  });

  factory UserStats.fromData(Map<String, dynamic> data) => UserStats(
      userId: data['userId'], username: data['username'], email: data['email']);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }
}
