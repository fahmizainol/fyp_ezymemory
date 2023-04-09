import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> logInWithEmail(String email, String password) async {
    try {
      await _authService.loginWithEmail(email: email, password: password);
      // TODO: make a user model and initialize it
      _navigationService.replaceWithHomeView();
    } catch (e) {
      e.toString();
    }
  }
}

// TODO: add validations for username and password
class LoginValidators {
  static String? validateReverseText(String? value) {
    if (value == null) {
      return null;
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
  }
}
