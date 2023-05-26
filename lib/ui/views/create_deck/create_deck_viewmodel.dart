import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateDeckViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  String currentDropdownValue = "Others";

  Future<void> createNewDeck(String deckName, String category) async {
    try {
      var response = await _firestoreService.createDeck(deckName, category);
      if (response) {
        await _dialogService.showDialog(title: "Create Deck success!");
        // _navigationService.back();
        // _navigationService.popUntil((route) => false)
        _navigationService.navigateToHomeView();
      }
    } catch (e) {}
  }

  void changeDropdownValue(newDropdownValue) {
    currentDropdownValue = newDropdownValue;
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
