import 'dart:async';
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
  final NavigationService _navigationService = locator<NavigationService>();

  // final Sm sm = Sm();

  int flashcardsListCount = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  List<Flashcard>? rightFetchedFlashcardList;
  List<List<String>>? questions;
  List<List<String>>? ans;

  double points = 0;
  int correctAns = 0;

  int? leftSelectedBoxIndex;
  int? leftPrevSelectedBoxIndex;

  int? rightSelectedBoxIndex;
  int? rightPrevSelectedBoxIndex;

  List<bool>? matchedQuestions;
  List<bool>? matchedAns;

  bool? showRes;
  String ansStatus = '';
  // TODO: limit:5 , min:1

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    fetchedFlashcardsList = await _firestoreService.getMatchFlashcards(deckId);
    rightFetchedFlashcardList = fetchedFlashcardsList;

    fetchedFlashcardsList!.shuffle();
    rightFetchedFlashcardList!.shuffle();
    flashcardsListCount = fetchedFlashcardsList!.length;
    constructCards();
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

  void compareCards() async {
    bool endGame;
    endGame = matchedQuestions!.every((element) => element == true);

    // print(endGame);
    if (leftSelectedBoxIndex != null && rightSelectedBoxIndex != null) {
      if (IterableEquality().equals(questions![leftSelectedBoxIndex ?? 0],
          ans![rightSelectedBoxIndex ?? 0])) {
        matchedQuestions![leftSelectedBoxIndex ?? 0] = true;
        matchedAns![rightSelectedBoxIndex ?? 0] = true;
        endGame = matchedQuestions!.every((element) => element == true);
        leftSelectedBoxIndex = null;
        rightSelectedBoxIndex = null;
        points += 50;
        showRes = true;
        ansStatus = 'Correct!';
        rebuildUi();
        Timer(Duration(seconds: 2), () {
          ansStatus = '';
          rebuildUi();
        });
        // return true;
      } else {
        leftSelectedBoxIndex = null;
        rightSelectedBoxIndex = null;
        points -= 30;
        showRes = true;
        ansStatus = 'Wrong!';
        rebuildUi();
        Timer(Duration(seconds: 2), () {
          ansStatus = '';
          rebuildUi();
        });
        // return false;
      }
    }
    if (endGame == true) {
      await _pointService.addPoints(2, points);
      await _dialogService.showDialog(
          title: 'You have finished the game!',
          description: 'You have received ${points} points!',
          barrierDismissible: true);
      _navigationService.back();
    }

    // return false;
  }
}
