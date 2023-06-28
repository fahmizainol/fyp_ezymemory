import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/app/app.bottomsheets.dart';
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
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeViewModel extends StreamViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthService _authService = locator<AuthService>();
  final LoggerService _loggerService = locator<LoggerService>();
  final PointService _pointService = locator<PointService>();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final header = "[home_view]";

  Offset tapPosition = Offset.zero;

  User? fetchedUser;
  List<Deck>? fetchedUserDeckList;
  int fetchedUserDeckListLength = 0;
  TabController? tabController;
  bool _notificationsEnabled = false;

  @override
  Stream get stream => init();

  Stream init() async* {
    _isAndroidPermissionGranted();
    _requestPermissions();
    var uid = await _authService.getCurrentUserId();
    fetchedUserDeckList = await _firestoreService.getUserDeckList();
    fetchedUserDeckListLength = fetchedUserDeckList!.length;
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
    await _pointService.addPoints(activity, 200);
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      _notificationsEnabled = granted;
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      _notificationsEnabled = granted ?? false;
    }
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
