import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:fyp_ezymemory/services/sm2_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:word_generator/word_generator.dart';

class GameMatchingViewModel extends FutureViewModel {
  final String deckId;
  GameMatchingViewModel({required this.deckId});

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final Sm2Service _sm2Service = locator<Sm2Service>();
  final PointService _pointService = locator<PointService>();

  // final Sm sm = Sm();

  int flashcardsListCount = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  List<Flashcard>? rightFetchedFlashcardList;
  List<List<String>>? questions;
  List<List<String>>? ans;

  int? points;
  int correctAns = 0;

  int? leftSelectedBoxIndex;
  int? leftPrevSelectedBoxIndex;

  int? rightSelectedBoxIndex;
  int? rightPrevSelectedBoxIndex;

  List<bool>? matchedQuestions;
  List<bool>? matchedAns;
  // TODO: limit:5 , min:1

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    fetchedFlashcardsList = await _firestoreService.getQuizFlashcards(deckId);
    rightFetchedFlashcardList = fetchedFlashcardsList;

    fetchedFlashcardsList!.shuffle();
    rightFetchedFlashcardList!.shuffle();
    flashcardsListCount = fetchedFlashcardsList!.length;
    constructCards();

    // TODO: create a list of words from the back side of the cards
  }

  void changeLeftSelectedBoxIndex(value) {
    leftPrevSelectedBoxIndex = leftSelectedBoxIndex;
    if (leftPrevSelectedBoxIndex == value) {
      leftSelectedBoxIndex = null;
      rebuildUi();
    } else {
      leftSelectedBoxIndex = value;
      rebuildUi();
    }

    // print(leftPrevSelectedBoxIndex);
    print(leftSelectedBoxIndex);
  }

  void removeLeftSelectedBoxIndex() {
    leftSelectedBoxIndex = null;
    rebuildUi();
    print(leftSelectedBoxIndex);
  }

  void changeRightSelectedBoxIndex(value) {
    rightPrevSelectedBoxIndex = rightSelectedBoxIndex;
    if (rightPrevSelectedBoxIndex == value) {
      rightSelectedBoxIndex = null;
      rebuildUi();
    } else {
      rightSelectedBoxIndex = value;
      rebuildUi();
    }
    // print(leftPrevSelectedBoxIndex);
    print(rightSelectedBoxIndex);
  }

  void constructCards() {
    questions = List.generate(flashcardsListCount, (index) {
      return [
        fetchedFlashcardsList![index].front,
        fetchedFlashcardsList![index].back
      ];
    });
    questions!.shuffle();
    matchedQuestions = List.filled(flashcardsListCount, false);
    matchedAns = List.filled(flashcardsListCount, false);

    ans = List.generate(flashcardsListCount, (index) {
      return [
        fetchedFlashcardsList![index].front,
        fetchedFlashcardsList![index].back
      ];
    });
    ans!.shuffle();

    print(questions.toString());
    print(matchedQuestions.toString());
  }

  void compareCards() {
    if (leftSelectedBoxIndex != null && rightSelectedBoxIndex != null) {
      if (IterableEquality().equals(questions![leftSelectedBoxIndex ?? 0],
          ans![rightSelectedBoxIndex ?? 0])) {
        matchedQuestions![leftSelectedBoxIndex ?? 0] = true;
        matchedAns![rightSelectedBoxIndex ?? 0] = true;
        print(matchedQuestions.toString());
        _dialogService.showDialog(
            barrierDismissible: true,
            title: 'Correct!',
            description: 'You have gained 50 points!');
        leftSelectedBoxIndex = null;
        rightSelectedBoxIndex = null;
      } else {
        _dialogService.showDialog(barrierDismissible: true, title: 'Wrong!');
        leftSelectedBoxIndex = null;
        rightSelectedBoxIndex = null;
      }
      // leftSelectedBoxIndex = null;
      // rightSelectedBoxIndex = null;
    }
  }
}
