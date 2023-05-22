// Mocks generated by Mockito 5.4.0 from annotations
// in fyp_ezymemory/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;
import 'dart:ui' as _i8;

import 'package:flutter/material.dart' as _i6;
import 'package:fyp_ezymemory/services/api_service.dart' as _i10;
import 'package:fyp_ezymemory/services/auth_service.dart' as _i9;
import 'package:fyp_ezymemory/services/firestore_service.dart' as _i11;
import 'package:fyp_ezymemory/services/logger_service.dart' as _i12;
import 'package:fyp_ezymemory/services/sm2_service.dart' as _i13;
import 'package:fyp_ezymemory/services/spacedr_service.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;
import 'package:simple_logger/simple_logger.dart' as _i2;
import 'package:spaced_repetition/sm.dart' as _i3;
import 'package:spaced_repetition/SmResponse.dart' as _i4;
import 'package:stacked_services/stacked_services.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSimpleLogger_0 extends _i1.SmartFake implements _i2.SimpleLogger {
  _FakeSimpleLogger_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSm_1 extends _i1.SmartFake implements _i3.Sm {
  _FakeSm_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSmResponse_2 extends _i1.SmartFake implements _i4.SmResponse {
  _FakeSmResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i5.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i6.GlobalKey<_i6.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i6.GlobalKey<_i6.NavigatorState>?);
  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i5.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<T?>? navigateWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWithTransition<T>(
    _i6.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i6.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i5.Transition? transitionClass,
    _i5.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(
    _i6.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? navigateToView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i6.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i5.Transition? transition,
    _i5.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i6.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearStackAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShowView<T>(
    _i6.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i6.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i7.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i5.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i5.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i7.Future<_i5.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.SheetResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.SheetResponse<dynamic>?>);
  @override
  _i7.Future<_i5.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i7.Future<_i5.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i5.SheetResponse<T>?>.value(),
      ) as _i7.Future<_i5.SheetResponse<T>?>);
  @override
  void completeSheet(_i5.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i5.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i5.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i6.Widget Function(
      _i6.BuildContext,
      _i5.DialogRequest<dynamic>,
      dynamic Function(_i5.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i7.Future<_i5.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i8.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i8.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<dynamic>?>);
  @override
  _i7.Future<_i5.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i8.Color? barrierColor = const _i8.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i7.Future<_i5.DialogResponse<T>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<T>?>);
  @override
  _i7.Future<_i5.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i8.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i8.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i5.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i7.Future<_i5.DialogResponse<dynamic>?>.value(),
      ) as _i7.Future<_i5.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i5.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i9.AuthService {
  @override
  String get header => (super.noSuchMethod(
        Invocation.getter(#header),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i7.Future<dynamic> loginWithEmail({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmail,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> signUpWithEmail({
    required String? email,
    required String? username,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpWithEmail,
          [],
          {
            #email: email,
            #username: username,
            #password: password,
          },
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> signOutUser() => (super.noSuchMethod(
        Invocation.method(
          #signOutUser,
          [],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> getCurrentUserId() => (super.noSuchMethod(
        Invocation.method(
          #getCurrentUserId,
          [],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i10.ApiService {}

/// A class which mocks [FirestoreService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreService extends _i1.Mock implements _i11.FirestoreService {
  @override
  String get header => (super.noSuchMethod(
        Invocation.getter(#header),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i7.Future<dynamic> createUser(
    String? username,
    String? email,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createUser,
          [
            username,
            email,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> getUser(String? uid) => (super.noSuchMethod(
        Invocation.method(
          #getUser,
          [uid],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<bool> createDeck(
    String? deckName,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createDeck,
          [
            deckName,
            category,
          ],
        ),
        returnValue: _i7.Future<bool>.value(false),
        returnValueForMissingStub: _i7.Future<bool>.value(false),
      ) as _i7.Future<bool>);
  @override
  _i7.Future<dynamic> getDeckById(String? deckId) => (super.noSuchMethod(
        Invocation.method(
          #getDeckById,
          [deckId],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> getDeckList() => (super.noSuchMethod(
        Invocation.method(
          #getDeckList,
          [],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> getUserDeckList() => (super.noSuchMethod(
        Invocation.method(
          #getUserDeckList,
          [],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> updateDeck(
    String? deckId,
    String? deckName,
    String? category,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateDeck,
          [
            deckId,
            deckName,
            category,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> deleteDeck(String? deckId) => (super.noSuchMethod(
        Invocation.method(
          #deleteDeck,
          [deckId],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> createFlashcard(
    String? deckId,
    String? front,
    String? back,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #createFlashcard,
          [
            deckId,
            front,
            back,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> getFlashcardListById(String? deckId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFlashcardListById,
          [deckId],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> updateFlashcardById(
    String? deckId,
    String? flashcardId,
    int? interval,
    int? repetitions,
    double? easeFactor,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateFlashcardById,
          [
            deckId,
            flashcardId,
            interval,
            repetitions,
            easeFactor,
          ],
        ),
        returnValue: _i7.Future<dynamic>.value(),
        returnValueForMissingStub: _i7.Future<dynamic>.value(),
      ) as _i7.Future<dynamic>);
}

/// A class which mocks [LoggerService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoggerService extends _i1.Mock implements _i12.LoggerService {
  @override
  _i2.SimpleLogger get logger => (super.noSuchMethod(
        Invocation.getter(#logger),
        returnValue: _FakeSimpleLogger_0(
          this,
          Invocation.getter(#logger),
        ),
        returnValueForMissingStub: _FakeSimpleLogger_0(
          this,
          Invocation.getter(#logger),
        ),
      ) as _i2.SimpleLogger);
  @override
  void setLoggerLevel() => super.noSuchMethod(
        Invocation.method(
          #setLoggerLevel,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void printInfo(
    dynamic header,
    dynamic message,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #printInfo,
          [
            header,
            message,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void printWarning(dynamic message) => super.noSuchMethod(
        Invocation.method(
          #printWarning,
          [message],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void printShout(dynamic message) => super.noSuchMethod(
        Invocation.method(
          #printShout,
          [message],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Sm2Service].
///
/// See the documentation for Mockito's code generation for more information.
class MockSm2Service extends _i1.Mock implements _i13.Sm2Service {
  @override
  _i3.Sm get sm => (super.noSuchMethod(
        Invocation.getter(#sm),
        returnValue: _FakeSm_1(
          this,
          Invocation.getter(#sm),
        ),
        returnValueForMissingStub: _FakeSm_1(
          this,
          Invocation.getter(#sm),
        ),
      ) as _i3.Sm);
  @override
  String get header => (super.noSuchMethod(
        Invocation.getter(#header),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i4.SmResponse calculateIRE(
    int? quality,
    int? repetitions,
    int? previousInterval,
    double? previousEaseFactor,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #calculateIRE,
          [
            quality,
            repetitions,
            previousInterval,
            previousEaseFactor,
          ],
        ),
        returnValue: _FakeSmResponse_2(
          this,
          Invocation.method(
            #calculateIRE,
            [
              quality,
              repetitions,
              previousInterval,
              previousEaseFactor,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeSmResponse_2(
          this,
          Invocation.method(
            #calculateIRE,
            [
              quality,
              repetitions,
              previousInterval,
              previousEaseFactor,
            ],
          ),
        ),
      ) as _i4.SmResponse);
}

/// A class which mocks [SpacedrService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSpacedrService extends _i1.Mock implements _i14.SpacedrService {
  @override
  _i3.Sm get sm => (super.noSuchMethod(
        Invocation.getter(#sm),
        returnValue: _FakeSm_1(
          this,
          Invocation.getter(#sm),
        ),
        returnValueForMissingStub: _FakeSm_1(
          this,
          Invocation.getter(#sm),
        ),
      ) as _i3.Sm);
  @override
  String get header => (super.noSuchMethod(
        Invocation.getter(#header),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  _i4.SmResponse calculateIRE(
    int? quality,
    int? repetitions,
    int? previousInterval,
    double? previousEaseFactor,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #calculateIRE,
          [
            quality,
            repetitions,
            previousInterval,
            previousEaseFactor,
          ],
        ),
        returnValue: _FakeSmResponse_2(
          this,
          Invocation.method(
            #calculateIRE,
            [
              quality,
              repetitions,
              previousInterval,
              previousEaseFactor,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeSmResponse_2(
          this,
          Invocation.method(
            #calculateIRE,
            [
              quality,
              repetitions,
              previousInterval,
              previousEaseFactor,
            ],
          ),
        ),
      ) as _i4.SmResponse);
}
