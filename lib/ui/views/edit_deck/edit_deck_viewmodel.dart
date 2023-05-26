import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/models/Deck/Deck.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:getwidget/getwidget.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditDeckViewModel extends FutureViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final String deckId;
  EditDeckViewModel({required this.deckId});

  Deck? fetchedDeck;
  String? currentDropdownValue;
  String? deckName;

  @override
  Future futureToRun() => getDeckById(deckId);

  Future getDeckById(String deckId) async {
    try {
      fetchedDeck = await _firestoreService.getDeckById(deckId);
      deckName = fetchedDeck!.name;
      currentDropdownValue = fetchedDeck!.category;
    } catch (e) {}
  }

  Future<bool> editDeck(String deckId, String deckName, String category) async {
    try {
      var response =
          await _firestoreService.updateDeck(deckId, deckName, category);

      if (response) {
        // rebuildUi();
        // notifySourceChanged();
        // notifyListeners();

        // rebu
        await _dialogService.showDialog(title: "Edit Deck success!");
        // _navigationService.popRepeated(1);
        _navigationService.navigateToHomeView();
        // Navigator.of(context).pop();
        // _bottomSheetService.showBottomSheet(
        //   title: "Edit Deck success!",
        //   barrierDismissible: true,

        //   confirmButtonTitle: "",
        // );
        // _bottomSheetService.showCustomSheet(
        //   title: "Edit Deck success!",
        //   description: "test",
        //   mainButtonTitle: "Stacked is shit",

        // );
        // _bottomSheetService.
        // GFToast.showToast("Edit deck Success!", context);
      }
      return response;
    } catch (e) {
      return false;
    }
  }

  void toHomeView() {
    _navigationService.navigateToHomeView();
  }

  void changeDropdownValue(newDropdownValue) {
    currentDropdownValue = newDropdownValue;
  }

  void changeDeckName(newDeckName) {
    deckName = newDeckName;
  }
}

class EditDeckValidators {
  static String? validateDeckName(String? value) {
    if (value!.isEmpty) {
      return 'Please fill up your password';
    }
    return null;
  }
}
