class Badge {
  final String userId;
  final String username;
  final String email;
  // final int points;
  // final List<Deck> deckList;
  // final List<Badge> badgeList;

  Badge({
    required this.userId,
    required this.username,
    required this.email,
    // TODO: add more
  });

  factory Badge.fromData(Map<String, dynamic> data) => Badge(
      userId: data['userId'], username: data['username'], email: data['email']);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }
}
