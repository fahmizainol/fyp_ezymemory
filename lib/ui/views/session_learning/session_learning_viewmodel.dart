import 'package:cloud_firestore/cloud_firestore.dart';
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

    // int count = await _firestoreService.checkFreshInUserStackCount(deckId);
    // print(count);

    // fetchedFlashcardsList!.sort((a, b) => a.reviewTime.compareTo(b.reviewTime));
  }

  Future updateFlashcard(int quality) async {
    Flashcard currentCard = fetchedFlashcardsList![count];

    if (currentCard.status == "fresh") freshFlashcardsCount--;
    if (currentCard.status == "review") reviewFlashcardsCount--;
    rebuildUi();

    SmResponse smResponse = _sm2Service.calculateIRE(quality,
        currentCard.repetitions, currentCard.interval, currentCard.easeFactor);

    DateTime currTime = DateTime.now();
    DateTime currDateOnly = currTime.copyWith(hour: 0, minute: 0, second: 0);

    print(currDateOnly);

    Timestamp reviewTime = Timestamp.fromDate(
        currDateOnly.add(Duration(days: smResponse.interval)));

    print(reviewTime);

    // update database
    await _firestoreService.updateFlashcardById(
      deckId: deckId,
      flashcardId: currentCard.id,
      reviewTime: reviewTime,
      interval: smResponse.interval,
      easeFactor: smResponse.easeFactor,
      inUserStack: false,
      repetitions: smResponse.repetitions,
      status: 'review',
    );

    nextCard();
  }

  // TODO: fetch 20 fresh cards and all due cards every single day.
  // - store userLastLogin timestamp
  // - compare with current time

  // - use local storage store 20 cards
  // - if < 20 cards then make request to firebase

  // - add bool inUserStack in flashcards collection to indicate whether the card is curr inside the user stack
  // - say user finishes 10/20 fresh cards, the next day they login check inUserStack < 20 (10). then fetch the next non-review 10 from firebase\
  // - only when user clicks on 'study deck'
  // - add fetchTime for the card to compare and check how many days have passed since last fetch. e.g: fetchTime 20/5, user log in 22/5.
  //   2 days have passed. there should be 40 cards added.

  // - store lastLoginTime in User
  // - if (timestamp.now() - lastLoginTime >= 1 day)
  // - fetch limit - requiredCountToReachLimit

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
        // await _firestoreService.updateFlashcardById(
        //     deckId, currentCard.id, 0, 0, 0, Timestamp.now());
        break;

      default:
    }
  }
}
