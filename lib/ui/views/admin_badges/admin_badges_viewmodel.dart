import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:fyp_ezymemory/app/app.router.dart';
import 'package:fyp_ezymemory/models/Badge/Badge.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminBadgesViewModel extends StreamViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  List<Badge>? fetchedBadgeList;
  int fetchedBadgeListLength = 0;

  @override
  // TODO: implement stream
  Stream get stream => init();

  Stream init() async* {
    fetchedBadgeList = await _firestoreService.getBadgeList();
    print(fetchedBadgeList.toString());
    fetchedBadgeListLength = fetchedBadgeList!.length;

    yield fetchedBadgeList;
  }

  Future<void> deleteBadge(String badgeId, String badgeName) async {
    var res = await _dialogService.showConfirmationDialog(
      barrierDismissible: true,
      title: "⚠️ Delete Operation",
      description:
          "Are you sure you want to delete $badgeName ? This action cannot be undone",
    );

    if (res!.confirmed) {
      await _firestoreService.deleteBadge(badgeId);
      await _dialogService.showDialog(title: "Delete badge success!");
      notifySourceChanged();
      // notifySourceChanged();
      // notifyListeners();
    } else {
      print(" not nc");
    }
  }

  void popupMenuLogic(int value, String badgeId, String badgeName) {
    switch (value) {
      case 0:
        deleteBadge(badgeId, badgeName);
        break;
      case 1:
        toEditBadgeView(badgeId);
        break;
      default:
    }
  }

  void toCreateBadgeView() {
    _navigationService.navigateToAdminCreateBadgeView();
  }

  void toEditBadgeView(String badgeId) {
    _navigationService.navigateToAdminEditBadgeView(badgeId: badgeId);
  }
}
