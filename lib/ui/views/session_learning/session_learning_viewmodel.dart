import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SessionLearningViewModel extends FutureViewModel {
  final String deckId;
  SessionLearningViewModel({required this.deckId});

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  int count = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  // TabController? tabController  = TabController(length: 3, vsync);

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    fetchedFlashcardsList =
        await _firestoreService.getFlashcardListById(deckId);
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
}
