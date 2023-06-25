import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminCreateBadgeViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final _imagePicker = ImagePicker();

  // String? image;
  String? name;
  String? description;
  XFile? badgeImg;
  var imgUrl;

  Future<void> createNewBadge(
      String image, String name, String description) async {
    try {
      imgUrl = await _firestoreService.uploadImg(badgeImg!.path);
      // print(imgUrl);
      var response =
          await _firestoreService.createBadge(imgUrl, name, description);

      // _navigationService.navigateToHomeAdminView();
      if (response) {
        await _dialogService.showDialog(title: "Create Badge success!");
        // _navigationService.back();
        // _navigationService.popUntil((route) => false)
        _navigationService.navigateToHomeAdminView();
      }
    } catch (e) {}
  }

  Future uploadImage() async {}

  void changeImageValue(newImageValue) {
    badgeImg = newImageValue;
    // print(badgeImg!.path);
  }

  void changeNameValue(newNameValue) {
    name = newNameValue;
  }

  void changeDescriptionValue(newDescValue) {
    description = newDescValue;
  }
}
