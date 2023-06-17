import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fyp_ezymemory/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fyp_ezymemory/services/auth_service.dart';
import 'package:fyp_ezymemory/services/api_service.dart';
import 'package:fyp_ezymemory/services/firestore_service.dart';
import 'package:fyp_ezymemory/services/logger_service.dart';
import 'package:fyp_ezymemory/services/sm2_service.dart';
import 'package:fyp_ezymemory/services/spacedr_service.dart';
import 'package:fyp_ezymemory/services/point_service.dart';
import 'package:fyp_ezymemory/services/notification_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FirestoreService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LoggerService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<Sm2Service>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<SpacedrService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<PointService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<NotificationService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAuthService();
  getAndRegisterApiService();
  getAndRegisterFirestoreService();
  getAndRegisterLoggerService();
  getAndRegisterSm2Service();
  getAndRegisterSpacedrService();
  getAndRegisterPointService();
  getAndRegisterNotificationService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockApiService getAndRegisterApiService() {
  _removeRegistrationIfExists<ApiService>();
  final service = MockApiService();
  locator.registerSingleton<ApiService>(service);
  return service;
}

MockFirestoreService getAndRegisterFirestoreService() {
  _removeRegistrationIfExists<FirestoreService>();
  final service = MockFirestoreService();
  locator.registerSingleton<FirestoreService>(service);
  return service;
}

MockLoggerService getAndRegisterLoggerService() {
  _removeRegistrationIfExists<LoggerService>();
  final service = MockLoggerService();
  locator.registerSingleton<LoggerService>(service);
  return service;
}

MockSm2Service getAndRegisterSm2Service() {
  _removeRegistrationIfExists<Sm2Service>();
  final service = MockSm2Service();
  locator.registerSingleton<Sm2Service>(service);
  return service;
}

MockSpacedrService getAndRegisterSpacedrService() {
  _removeRegistrationIfExists<SpacedrService>();
  final service = MockSpacedrService();
  locator.registerSingleton<SpacedrService>(service);
  return service;
}

MockPointService getAndRegisterPointService() {
  _removeRegistrationIfExists<PointService>();
  final service = MockPointService();
  locator.registerSingleton<PointService>(service);
  return service;
}

MockNotificationService getAndRegisterNotificationService() {
  _removeRegistrationIfExists<NotificationService>();
  final service = MockNotificationService();
  locator.registerSingleton<NotificationService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
