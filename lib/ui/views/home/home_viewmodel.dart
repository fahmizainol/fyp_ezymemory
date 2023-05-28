import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp_ezymemory/app/app.bottomsheets.dart';
import 'package:fyp_ezymemory/app/app.dialogs.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/models/User/User.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:fyp_ezymemory/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends StreamViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();
  final PointService _pointService = locator<PointService>();

  final header = "[home_view]";

  Offset tapPosition = Offset.zero;

  User? fetchedUser;
  List<Deck>? fetchedUserDeckList;
  TabController? tabController;

  @override
  Stream get stream => init();

  Stream init() async* {
    var uid = await _authService.getCurrentUserId();
    fetchedUserDeckList = await _firestoreService.getUserDeckList();
    fetchedUser = await _firestoreService.getUser(uid);

    // _loggerService.printInfo(header, "test: ${fetchedUserDeckList!}");
    // _loggerService.printInfo(header, "test: ${fetchedUserDeckList!.length}");
    yield fetchedUserDeckList;
  }

  Future<void> deleteDeck(String deckId, String deckName) async {
    var res = await _dialogService.showConfirmationDialog(
      barrierDismissible: true,
      title: "⚠️ Delete Operation",
      description:
          "Are you sure you want to delete $deckName ? This action cannot be undone",
    );

    if (res!.confirmed) {
      await _firestoreService.deleteDeck(deckId);
      await _dialogService.showDialog(title: "Delete deck success!");
      notifySourceChanged();
      // notifySourceChanged();
      // notifyListeners();
    } else {
      print(" not nc");
    }
  }

  Future signOut() async {
    _loggerService.printInfo(header,
        "signOut: b4 fetchedUserDeckList $fetchedUserDeckList.toString()");
    await _authService.signOutUser();
    _loggerService.printInfo(header,
        "signOut: after fetchedUserDeckList $fetchedUserDeckList.toString()");

    // _loggerService.printInfo(header,
    //     "signOut: after disposefetchedUserDeckList $fetchedUserDeckList.toString()");
    await _navigationService.navigateToLoginView();
    dispose();
  }

  Future addPoints(int activity) async {
    // TODO: add logic for checking in
    await _pointService.addPoints(activity);
  }

  void toImportDeckView() {
    _navigationService.navigateToImportDeckView().then((value) => initialise());
  }

  void toCreateDeckView() {
    _navigationService.navigateToCreateDeckView();
  }

  void toEditDeckView(String deckId) {
    _navigationService.navigateToEditDeckView(key: UniqueKey(), deckId: deckId);
  }

  void toCreateFlashcardView(String deckId, String deckName) {
    _navigationService.navigateToCreateFlashcardView(
        key: UniqueKey(), deckId: deckId, deckName: deckName);
  }

  // TODO: add cards count
  void toSessionChooserView(String deckId, String deckName) {
    _navigationService.navigateToSessionChooserView(
        key: UniqueKey(), deckId: deckId, deckName: deckName);
  }

  void showDeleteDialog() {
    _dialogService.showConfirmationDialog(
        title: "Are you sure you want to delete ");
  }

  void showDialog() {
    _navigationService.navigateToCounterView();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  void popupMenuLogic(int value, String deckId, String deckName) {
    switch (value) {
      case 0:
        toEditDeckView(deckId);
        break;
      case 1:
        deleteDeck(deckId, deckName);
        break;
      case 2:
        print("2");
        break;
      case 3:
        toCreateFlashcardView(deckId, deckName);
        break;
      case 4:
        toSessionChooserView(deckId, deckName);
        break;
      default:
    }
  }
}
