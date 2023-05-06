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

  final header = "[home_view]";

  Offset tapPosition = Offset.zero;

  User? fetchedUser;
  List<Deck>? fetchedUserDeckList;

  @override
  // TODO: implement stream
  Stream get stream => init();

  Stream init() async* {
    fetchedUserDeckList = await _firestoreService.getUserDeckList();
    fetchedUser =
        await _firestoreService.getUser(_authService.currentUser!.uid);

    _loggerService.printInfo(header, "test: ${fetchedUserDeckList!.length}");
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

  void toCreateDeckView() {
    _navigationService.navigateToCreateDeckView();
  }

  void toEditDeckView(String deckId) {
    _navigationService.navigateToEditDeckView(key: UniqueKey(), deckId: deckId);
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
      default:
    }
  }
}
