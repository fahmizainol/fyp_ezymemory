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
import 'package:fyp_ezymemory/ui/views/create_flashcard/create_flashcard_view.dart';
import 'package:fyp_ezymemory/ui/views/session_chooser/session_chooser_view.dart';
import 'package:fyp_ezymemory/ui/views/session_learning/session_learning_view.dart';
import 'package:fyp_ezymemory/ui/views/em_learning_bar/em_learning_bar_view.dart';
import 'package:fyp_ezymemory/services/sm2_service.dart';
import 'package:fyp_ezymemory/services/spacedr_service.dart';
import 'package:fyp_ezymemory/ui/views/import_deck/import_deck_view.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:fyp_ezymemory/ui/views/leaderboard/leaderboard_view.dart';
import 'package:fyp_ezymemory/ui/views/progress/progress_view.dart';
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
    MaterialRoute(page: CreateFlashcardView),
    MaterialRoute(page: SessionChooserView),
    MaterialRoute(page: SessionLearningView),
    MaterialRoute(page: EmLearningBarView),
    MaterialRoute(page: ImportDeckView),
    MaterialRoute(page: LeaderboardView),
    MaterialRoute(page: ProgressView),
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
    LazySingleton(classType: Sm2Service),
    LazySingleton(classType: SpacedrService),
    LazySingleton(classType: PointService),
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
