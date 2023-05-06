import 'package:fyp_ezymemory/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:fyp_ezymemory/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:fyp_ezymemory/ui/views/home/home_view.dart';
import 'package:fyp_ezymemory/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fyp_ezymemory/ui/views/counter/counter_view.dart';
import 'package:fyp_ezymemory/ui/views/login/login_view.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/api_service.dart';
import 'package:fyp_ezymemory/ui/views/register/register_view.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:fyp_ezymemory/ui/views/create_deck/create_deck_view.dart';
import 'package:fyp_ezymemory/ui/views/edit_deck/edit_deck_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: CreateDeckView),
    MaterialRoute(page: EditDeckView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: LoggerService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
