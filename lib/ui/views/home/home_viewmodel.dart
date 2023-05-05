import 'package:fyp_ezymemory/app/app.bottomsheets.dart';
import 'package:fyp_ezymemory/app/app.dialogs.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:fyp_ezymemory/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FutureViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();

  final header = "[home_view]";

  User? fetchedUser;

  @override
  Future futureToRun() => getUser();

  Future<void> getUser() async {
    // setBusy(true);
    _loggerService.printInfo(
        header, "futureToRun: currentUser $_authService.currentUser!.uid");

    var response =
        await _firestoreService.getUser(_authService.currentUser!.uid);

    fetchedUser = User.fromJson(response);

    // setBusy(false);
    _loggerService.printInfo(header, "futureToRun: $fetchedUser");
    // print("futureToRun: $fetchedUser");
  }

  void toCreateDeckView() {
    _navigationService.navigateToCreateDeckView();
  }

  void showDialog() {
    // _dialogService.showCustomDialog(
    //   variant: DialogType.infoAlert,
    //   title: 'Stacked Rocks!',
    //   description: 'Give stacked $_counter stars on Github',
    // );
    _navigationService.navigateToCounterView();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
