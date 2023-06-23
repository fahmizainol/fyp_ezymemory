import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/models/Badge/Badge.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminEditBadgeViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final _imagePicker = ImagePicker();

  final String badgeId;
  AdminEditBadgeViewModel({required this.badgeId});

  Badge? fetchedBadge;
  String? name;
  String? description;
  String? badgeImg;

  @override
  Future futureToRun() => getBadgeById(badgeId);

  Future getBadgeById(badgeId) async {
    fetchedBadge = await _firestoreService.getBadgeById(badgeId);
    name = fetchedBadge!.name;
    description = fetchedBadge!.description;
    badgeImg = fetchedBadge!.image;
  }

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
