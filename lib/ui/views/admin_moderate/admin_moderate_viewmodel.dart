import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminModerateViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  List<Deck>? fetchedDeckList;
  int fetchedDeckListLength = 0;

  @override
  Future futureToRun() => getDeckList();

  Future getDeckList() async {
    fetchedDeckList = await _firestoreService.getSharedDeckList();
    fetchedDeckListLength = fetchedDeckList!.length;
  }

  Future importDeck(Deck importedDeck) async {
    await _firestoreService.importUserDeck(importedDeck);
    // rebuildUi();
    // _navigationService.navigateTo(_navigationService.previousRoute);
    // _navigationService.popRepeated(1);
    // _navigationService.popUntil((route) => false).
    // RebuildDirtyWidgetCallback
    // notifyListeners()
  }

  Future<void> deleteDeck(String deckId, String deckName) async {
    var res = await _dialogService.showConfirmationDialog(
      barrierDismissible: true,
      title: "⚠️ Delete Operation",
      description:
          "Are you sure you want to delete $deckName ? This action cannot be undone",
    );

    if (res!.confirmed) {
      await _firestoreService.deleteDeck(deckId);
      await _dialogService.showDialog(title: "Delete deck success!");
      notifySourceChanged();
      // notifySourceChanged();
      // notifyListeners();
    } else {
      print(" not nc");
    }
  }

  void popupMenuLogic(int value, String deckId, String deckName) {
    switch (value) {
      case 0:
        deleteDeck(deckId, deckName);
        break;
      default:
    }
  }
}
