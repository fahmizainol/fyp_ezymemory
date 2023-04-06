import 'package:stacked/stacked.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  String get reversedText =>
      hasUserName ? userNameValue!.split('').reversed.join('') : '----';
}

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
