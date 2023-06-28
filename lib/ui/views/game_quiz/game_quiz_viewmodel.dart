import 'dart:math';

import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Flashcard/Flashcard.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:fyp_ezymemory/services/sm2_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:word_generator/word_generator.dart';

class GameQuizViewModel extends FutureViewModel {
  final String deckId;
  GameQuizViewModel({required this.deckId});

  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final Sm2Service _sm2Service = locator<Sm2Service>();
  final PointService _pointService = locator<PointService>();
  final NavigationService _navigationService = locator<NavigationService>();

  // final Sm sm = Sm();

  int flashcardsListCount = 0;
  bool frontVisible = true;
  List<Flashcard>? fetchedFlashcardsList;
  int freshFlashcardsCount = 0;
  int reviewFlashcardsCount = 0;
  List<String>? ans;
  List<List<String>>? ansList;
  double points = 0;
  int correctAns = 0;
  // TabController? tabController  = TabController(length: 3, vsync);

  @override
  Future futureToRun() => getFlashcardsList(deckId);

  Future getFlashcardsList(String deckId) async {
    fetchedFlashcardsList = await _firestoreService.getQuizFlashcards(deckId);
    flashcardsListCount = fetchedFlashcardsList!.length;
    constructAnsList();

    // TODO: create a list of words from the back side of the cards
  }

  Future nextCard() async {
    if (flashcardsListCount < (fetchedFlashcardsList!.length - 1)) {
      flashcardsListCount++;
      frontVisible = true;
      rebuildUi();
    } else {
      // add points to the user
      await _pointService.addPoints(1, 300);
      _dialogService.showDialog(
          title:
              'Congrats you have received 400pts for finishing the learning session for today!');
    }
  }

  void constructAnsList() {
    final wordGen = WordGenerator();
    ans = List.generate(flashcardsListCount, (index) => '');

    ansList = List.generate(flashcardsListCount, (indexL) {
      Random random = Random();
      var randomInt = random.nextInt(4);
      return List.generate(4, (index) {
        if (index == randomInt) {
          return fetchedFlashcardsList![indexL].back;
        } else {
          return wordGen.randomNoun();
        }
        // return fetchedFlashcardsList![0].back;
      });
    });

    print(ansList.toString());
  }

  // TODO: determine the right ans
  void checkAns() async {
    // check if the value of the string inside the option equal to the back of the card
    for (var i = 0; i < flashcardsListCount; i++) {
      if (ans![i] == fetchedFlashcardsList![i].back) {
        print('correct');
        correctAns += 1;
      } else {
        print('wrong');
      }
    }

    points = correctAns * 50;
    await _pointService.addPoints(2, points);
    await _dialogService.showDialog(
        title: 'You have finished the quiz!',
        description:
            'You answered ${correctAns} out of ${flashcardsListCount} and received ${points}');

    if (correctAns == flashcardsListCount) {
      await _firestoreService
          .addBadgeToUser('fdc80f7d-98e2-4b0e-be7a-15b1f26c0d0b');
      await _dialogService.showDialog(
          title: 'You have received the badge Trivia Whiz!',
          description: 'For scoring perfect score in quiz!');
    }

    correctAns = 0;

    // print('${correctAns} out of ${flashcardsListCount}');
    _navigationService.back();
    // if (ans == fetchedFlashcardsList![flashcardsListCount].back) {
    //   print('corect');
    // } else {
    //   print('wrong');
    // }
  }

  void quizTemplate() {}

  void changeAnsValue(index, ansValue) {
    ans![index] = ansValue;
    print(ans);
  }
}
