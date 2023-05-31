import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SessionChooserViewModel extends BaseViewModel {
  final String deckId;
  final String deckName;
  SessionChooserViewModel(this.deckName, {required this.deckId});

  // TODO run the future for learning session here

  final NavigationService _navigationService = locator<NavigationService>();

  void toSessionLearningView(String deckId) {
    _navigationService.navigateToSessionLearningView(deckId: deckId);
  }
}
