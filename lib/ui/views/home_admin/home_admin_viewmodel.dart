import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeAdminViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void toModerateContentView() {
    _navigationService.navigateToAdminModerateView();
  }
}
