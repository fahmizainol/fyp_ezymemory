class Deck {
  final String userId;
  final String username;
  final String email;
  // final int points;
  // final List<Deck> deckList;
  // final List<Badge> badgeList;

  Deck({
    required this.userId,
    required this.username,
    required this.email,
    // TODO: add more
  });

  factory Deck.fromData(Map<String, dynamic> data) => Deck(
      userId: data['userId'], username: data['username'], email: data['email']);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }
}
