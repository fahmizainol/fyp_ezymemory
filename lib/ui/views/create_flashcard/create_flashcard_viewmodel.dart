import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateFlashcardViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final String deckId;
  final String deckName;
  CreateFlashcardViewModel(this.deckName, {required this.deckId});

  String? front;
  String? back;

  Future<void> createNewFlashcard(
      String deckId, String front, String back) async {
    try {
      var response =
          await _firestoreService.createFlashcard(deckId, front, back);
      front = '';
      back = '';
      rebuildUi();
      if (response) {
        await _dialogService.showDialog(
            title: "Card saved successfully!", barrierDismissible: true);
        // _navigationService.back();
      }
    } catch (e) {}
  }

  // void changeDropdownValue(newDropdownValue) {
  //   currentDropdownValue = newDropdownValue;
  // }
  void changeFront(newFront) {
    front = newFront;
  }

  void changeBack(newBack) {
    back = newBack;
  }
}

class CreateDeckValidators {
  static String? validateDeckName(String? value) {
    if (value!.isEmpty) {
      return 'Please fill up your password';
    }
    return null;
  }
}
