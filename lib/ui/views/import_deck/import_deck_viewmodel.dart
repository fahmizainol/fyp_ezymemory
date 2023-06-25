import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImportDeckViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();

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

  // TODO: filtering function based on categories
}
