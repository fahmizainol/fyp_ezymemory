import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future logInWithEmail(String email, String password) async {
    try {
      await _authService.loginWithEmail(email: email, password: password);
      // TODO: make a user model and initialize it
      // _navigationService.replaceWithHomeView();
      print('object');
    } catch (e) {
      return e.toString();
      // print('error');
    }
  }
}

// TODO: add validations for username and password
class LoginValidators {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email field must not be null';
    }

    if (value!.isNotEmpty &&
        !value.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$'))) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Please fill up your password';
    }
    return null;
  }
}
