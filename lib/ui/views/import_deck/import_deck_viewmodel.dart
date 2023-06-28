import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImportDeckViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Deck>? fetchedDeckList;
  int fetchedDeckListLength = 0;
  int importDeckCount = 0;

  @override
  Future futureToRun() => getDeckList();

  Future getDeckList() async {
    fetchedDeckList = await _firestoreService.getSharedDeckList();
    fetchedDeckListLength = fetchedDeckList!.length;
  }

  Future importDeck(Deck importedDeck) async {
    await _firestoreService.importUserDeck(importedDeck);
    await _dialogService.showDialog(
        title: 'You have successfully imported ${importedDeck.name}!');
    importDeckCount += 1;

    if (importDeckCount == 3) {
      await _firestoreService
          .addBadgeToUser('c98c7da5-b637-45c4-a502-ec79140e736b');
      await _dialogService.showDialog(
          title: 'You have received the badge Flashcard Explorer!',
          description: 'For importing more than 2 decks!');
    }
    // rebuildUi();
    // _navigationService.navigateTo(_navigationService.previousRoute);
    // _navigationService.popRepeated(1);
    // _navigationService.popUntil((route) => false).
    // RebuildDirtyWidgetCallback
    // notifyListeners()
  }

  // TODO: filtering function based on categories
}
