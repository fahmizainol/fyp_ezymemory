import 'package:collection/collection.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/models/UserStats/UserStats.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import 'deck_stats.dart';

class ProgressViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();

  User? fetchedUser;
  List<Deck>? fetchedUserDeckList;
  List<DeckStats>? deckStatsList;
  List<UserStats>? userStatsList;

  int totalDeck = 0;
  List? categoryCount;
  int totalSharedDeck = 0;

  @override
  Future futureToRun() => getUserProgress();

  Future getUserProgress() async {
    var uid = await _authService.getCurrentUserId();
    fetchedUser = await _firestoreService.getUser(uid);
    fetchedUserDeckList = await _firestoreService.getUserDeckList();
    userStatsList = await _firestoreService.getUserStatsList();
    totalDeck = fetchedUserDeckList!.length;
    totalSharedDeck =
        fetchedUserDeckList!.where((deck) => deck.isShared == true).length;
    // initiate DeckStats
    deckStatsList = calculateDeckStats(fetchedUserDeckList ?? []);
    print(deckStatsList![0].count);
  }

  List<DeckStats> calculateDeckStats(List<Deck> deckList) {
    final deckMap = groupBy(deckList, (Deck deck) => deck.category);
    final deckStatsList = <DeckStats>[];

    deckMap.forEach((category, decks) {
      final deckStats = DeckStats(category, decks.length);
      deckStatsList.add(deckStats);
    });

    return deckStatsList;
  }

  // total deck, deck category, isShared deck count

  // TODO: add user study duration stats
}
