import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future<void> signUpWithEmail(
      String email, String password, String username) async {
    try {
      await _authService.signUpWithEmail(
          email: email, password: password, username: username);
      // TODO: make a user model and initialize it
      _navigationService.navigateToHomeView();
    } catch (e) {
      e.toString();
    }
  }
}

// TODO: if account already exist error
class RegisterValidators {
  static String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'Username field must not be null';
    }
    if (value.length < 5) {
      return 'Username must be at least 5 characters long';
    }
    if (value!.isNotEmpty && !value.contains(RegExp(r'^[a-zA-Z0-9]+$'))) {
      return 'Only A-z and 0-9 are allowed';
    }
    return null;
  }

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
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password must contain at least one alphabet';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
