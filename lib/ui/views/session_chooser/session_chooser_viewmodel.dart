import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SessionChooserViewModel extends FutureViewModel {
  final String deckId;
  final String deckName;
  SessionChooserViewModel(this.deckName, {required this.deckId});

  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  int count = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  int freshFlashcardsCount = 0;
  int reviewFlashcardsCount = 0;

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    try {
      var checkFreshFetch = await _firestoreService.checkFreshFetch(deckId);

      if (checkFreshFetch) {
        print('if');
        fetchedFlashcardsList =
            await _firestoreService.getFreshFlashcardListById(deckId);
      } else {
        print('e;se');
        fetchedFlashcardsList =
            await _firestoreService.getFlashcardListById(deckId);
      }

      freshFlashcardsCount = fetchedFlashcardsList!
          .where((element) => element.status.contains("fresh"))
          .toList()
          .length;
      reviewFlashcardsCount = fetchedFlashcardsList!
          .where((element) => element.status.contains("review"))
          .toList()
          .length;
    } catch (e) {
      print(e.toString());
    }
  }

  void toSessionLearningView(String deckId) {
    _navigationService.navigateToSessionLearningView(deckId: deckId);
  }

  void toGameQuizView() {
    _navigationService.navigateToGameQuizView(deckId: deckId);
  }

  void toGameMatchingView() {
    _navigationService.navigateToGameMatchingView(deckId: deckId);
  }

  // @override
  // Future futureToRun() {
  //   // TODO: implement futureToRun
  //   throw UnimplementedError();
  // }

  // TODO: pull the futureToRun from session learning to here
}
