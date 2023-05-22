import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/sm2_service.dart';
import 'package:fyp_ezymemory/services/spacedr_service.dart';
import 'package:spaced_repetition/SmResponse.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SessionLearningViewModel extends FutureViewModel {
  final String deckId;
  SessionLearningViewModel({required this.deckId});

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final Sm2Service _sm2Service = locator<Sm2Service>();

  // final Sm sm = Sm();

  int count = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  int freshFlashcardsCount = 0;
  int reviewFlashcardsCount = 0;
  // TabController? tabController  = TabController(length: 3, vsync);

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    fetchedFlashcardsList =
        await _firestoreService.getFlashcardListById(deckId);

    freshFlashcardsCount = fetchedFlashcardsList!
        .where((element) => element.status.contains("fresh"))
        .toList()
        .length;
    reviewFlashcardsCount = fetchedFlashcardsList!
        .where((element) => element.status.contains("review"))
        .toList()
        .length;
    // fetchedFlashcardsList!.sort((a, b) => a.reviewTime.compareTo(b.reviewTime));
  }

  Future updateFlashcard(int quality) async {
    Flashcard currentCard = fetchedFlashcardsList![count];

    if (currentCard.status == "fresh") freshFlashcardsCount--;
    if (currentCard.status == "review") reviewFlashcardsCount--;
    rebuildUi();

    SmResponse smResponse = _sm2Service.calculateIRE(quality,
        currentCard.repetitions, currentCard.interval, currentCard.easeFactor);

    // update database
    await _firestoreService.updateFlashcardById(deckId, currentCard.id,
        smResponse.interval, smResponse.repetitions, smResponse.easeFactor);

    nextCard();
  }

  void showAns() {
    frontVisible = false;
    rebuildUi();
  }

  void nextCard() {
    if (count < (fetchedFlashcardsList!.length - 1)) {
      count++;
      frontVisible = true;
      rebuildUi();
    } else {
      _dialogService.showDialog(title: 'your last card!');
    }
  }

  Future debugMenuLogic(int value) async {
    Flashcard currentCard = fetchedFlashcardsList![count];
    switch (value) {
      case 0:
        // FIXME: data wasnt refetched back from firebase meaning the currentCard still holds the prev values despite firebase being resetted
        await _firestoreService.updateFlashcardById(
            deckId, currentCard.id, 0, 0, 0);
        break;

      default:
    }
  }
}
