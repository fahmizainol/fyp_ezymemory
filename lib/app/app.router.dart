// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i17;
import 'package:flutter/material.dart';
import 'package:fyp_ezymemory/ui/views/counter/counter_view.dart' as _i4;
import 'package:fyp_ezymemory/ui/views/create_deck/create_deck_view.dart'
    as _i7;
import 'package:fyp_ezymemory/ui/views/create_flashcard/create_flashcard_view.dart'
    as _i9;
import 'package:fyp_ezymemory/ui/views/edit_deck/edit_deck_view.dart' as _i8;
import 'package:fyp_ezymemory/ui/views/em_learning_bar/em_learning_bar_view.dart'
    as _i12;
import 'package:fyp_ezymemory/ui/views/home/home_view.dart' as _i2;
import 'package:fyp_ezymemory/ui/views/import_deck/import_deck_view.dart'
    as _i13;
import 'package:fyp_ezymemory/ui/views/leaderboard/leaderboard_view.dart'
    as _i14;
import 'package:fyp_ezymemory/ui/views/login/login_view.dart' as _i5;
import 'package:fyp_ezymemory/ui/views/progress/progress_view.dart' as _i15;
import 'package:fyp_ezymemory/ui/views/register/register_view.dart' as _i6;
import 'package:fyp_ezymemory/ui/views/session_chooser/session_chooser_view.dart'
    as _i10;
import 'package:fyp_ezymemory/ui/views/session_learning/session_learning_view.dart'
    as _i11;
import 'package:fyp_ezymemory/ui/views/startup/startup_view.dart' as _i3;
import 'package:fyp_ezymemory/ui/views/user_settings/user_settings_view.dart'
    as _i16;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const counterView = '/counter-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const createDeckView = '/create-deck-view';

  static const editDeckView = '/edit-deck-view';

  static const createFlashcardView = '/create-flashcard-view';

  static const sessionChooserView = '/session-chooser-view';

  static const sessionLearningView = '/session-learning-view';

  static const emLearningBarView = '/em-learning-bar-view';

  static const importDeckView = '/import-deck-view';

  static const leaderboardView = '/leaderboard-view';

  static const progressView = '/progress-view';

  static const userSettingsView = '/user-settings-view';

  static const all = <String>{
    homeView,
    startupView,
    counterView,
    loginView,
    registerView,
    createDeckView,
    editDeckView,
    createFlashcardView,
    sessionChooserView,
    sessionLearningView,
    emLearningBarView,
    importDeckView,
    leaderboardView,
    progressView,
    userSettingsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.counterView,
      page: _i4.CounterView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i6.RegisterView,
    ),
    _i1.RouteDef(
      Routes.createDeckView,
      page: _i7.CreateDeckView,
    ),
    _i1.RouteDef(
      Routes.editDeckView,
      page: _i8.EditDeckView,
    ),
    _i1.RouteDef(
      Routes.createFlashcardView,
      page: _i9.CreateFlashcardView,
    ),
    _i1.RouteDef(
      Routes.sessionChooserView,
      page: _i10.SessionChooserView,
    ),
    _i1.RouteDef(
      Routes.sessionLearningView,
      page: _i11.SessionLearningView,
    ),
    _i1.RouteDef(
      Routes.emLearningBarView,
      page: _i12.EmLearningBarView,
    ),
    _i1.RouteDef(
      Routes.importDeckView,
      page: _i13.ImportDeckView,
    ),
    _i1.RouteDef(
      Routes.leaderboardView,
      page: _i14.LeaderboardView,
    ),
    _i1.RouteDef(
      Routes.progressView,
      page: _i15.ProgressView,
    ),
    _i1.RouteDef(
      Routes.userSettingsView,
      page: _i16.UserSettingsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.CounterView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.CounterView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.LoginView(key: args.key),
        settings: data,
      );
    },
    _i6.RegisterView: (data) {
      final args = data.getArgs<RegisterViewArguments>(
        orElse: () => const RegisterViewArguments(),
      );
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.RegisterView(key: args.key),
        settings: data,
      );
    },
    _i7.CreateDeckView: (data) {
      final args = data.getArgs<CreateDeckViewArguments>(
        orElse: () => const CreateDeckViewArguments(),
      );
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.CreateDeckView(key: args.key),
        settings: data,
      );
    },
    _i8.EditDeckView: (data) {
      final args = data.getArgs<EditDeckViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.EditDeckView(args.deckId, key: args.key),
        settings: data,
      );
    },
    _i9.CreateFlashcardView: (data) {
      final args = data.getArgs<CreateFlashcardViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.CreateFlashcardView(args.deckId, args.deckName, key: args.key),
        settings: data,
      );
    },
    _i10.SessionChooserView: (data) {
      final args = data.getArgs<SessionChooserViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i10.SessionChooserView(args.deckId, args.deckName, key: args.key),
        settings: data,
      );
    },
    _i11.SessionLearningView: (data) {
      final args = data.getArgs<SessionLearningViewArguments>(nullOk: false);
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i11.SessionLearningView(args.deckId, key: args.key),
        settings: data,
      );
    },
    _i12.EmLearningBarView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.EmLearningBarView(),
        settings: data,
      );
    },
    _i13.ImportDeckView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ImportDeckView(),
        settings: data,
      );
    },
    _i14.LeaderboardView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.LeaderboardView(),
        settings: data,
      );
    },
    _i15.ProgressView: (data) {
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.ProgressView(),
        settings: data,
      );
    },
    _i16.UserSettingsView: (data) {
      final args = data.getArgs<UserSettingsViewArguments>(
        orElse: () => const UserSettingsViewArguments(),
      );
      return _i17.MaterialPageRoute<dynamic>(
        builder: (context) => _i16.UserSettingsView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class RegisterViewArguments {
  const RegisterViewArguments({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RegisterViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class CreateDeckViewArguments {
  const CreateDeckViewArguments({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant CreateDeckViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EditDeckViewArguments {
  const EditDeckViewArguments({
    required this.deckId,
    this.key,
  });

  final String deckId;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"deckId": "$deckId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant EditDeckViewArguments other) {
    if (identical(this, other)) return true;
    return other.deckId == deckId && other.key == key;
  }

  @override
  int get hashCode {
    return deckId.hashCode ^ key.hashCode;
  }
}

class CreateFlashcardViewArguments {
  const CreateFlashcardViewArguments({
    required this.deckId,
    required this.deckName,
    this.key,
  });

  final String deckId;

  final String deckName;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"deckId": "$deckId", "deckName": "$deckName", "key": "$key"}';
  }

  @override
  bool operator ==(covariant CreateFlashcardViewArguments other) {
    if (identical(this, other)) return true;
    return other.deckId == deckId &&
        other.deckName == deckName &&
        other.key == key;
  }

  @override
  int get hashCode {
    return deckId.hashCode ^ deckName.hashCode ^ key.hashCode;
  }
}

class SessionChooserViewArguments {
  const SessionChooserViewArguments({
    required this.deckId,
    required this.deckName,
    this.key,
  });

  final String deckId;

  final String deckName;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"deckId": "$deckId", "deckName": "$deckName", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SessionChooserViewArguments other) {
    if (identical(this, other)) return true;
    return other.deckId == deckId &&
        other.deckName == deckName &&
        other.key == key;
  }

  @override
  int get hashCode {
    return deckId.hashCode ^ deckName.hashCode ^ key.hashCode;
  }
}

class SessionLearningViewArguments {
  const SessionLearningViewArguments({
    required this.deckId,
    this.key,
  });

  final String deckId;

  final _i17.Key? key;

  @override
  String toString() {
    return '{"deckId": "$deckId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SessionLearningViewArguments other) {
    if (identical(this, other)) return true;
    return other.deckId == deckId && other.key == key;
  }

  @override
  int get hashCode {
    return deckId.hashCode ^ key.hashCode;
  }
}

class UserSettingsViewArguments {
  const UserSettingsViewArguments({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant UserSettingsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i18.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCounterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.counterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateDeckView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createDeckView,
        arguments: CreateDeckViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditDeckView({
    required String deckId,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editDeckView,
        arguments: EditDeckViewArguments(deckId: deckId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateFlashcardView({
    required String deckId,
    required String deckName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createFlashcardView,
        arguments: CreateFlashcardViewArguments(
            deckId: deckId, deckName: deckName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSessionChooserView({
    required String deckId,
    required String deckName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sessionChooserView,
        arguments: SessionChooserViewArguments(
            deckId: deckId, deckName: deckName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSessionLearningView({
    required String deckId,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.sessionLearningView,
        arguments: SessionLearningViewArguments(deckId: deckId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEmLearningBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.emLearningBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImportDeckView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.importDeckView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLeaderboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.leaderboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProgressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.progressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserSettingsView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.userSettingsView,
        arguments: UserSettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCounterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.counterView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerView,
        arguments: RegisterViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateDeckView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createDeckView,
        arguments: CreateDeckViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditDeckView({
    required String deckId,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editDeckView,
        arguments: EditDeckViewArguments(deckId: deckId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCreateFlashcardView({
    required String deckId,
    required String deckName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.createFlashcardView,
        arguments: CreateFlashcardViewArguments(
            deckId: deckId, deckName: deckName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSessionChooserView({
    required String deckId,
    required String deckName,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sessionChooserView,
        arguments: SessionChooserViewArguments(
            deckId: deckId, deckName: deckName, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSessionLearningView({
    required String deckId,
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.sessionLearningView,
        arguments: SessionLearningViewArguments(deckId: deckId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEmLearningBarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.emLearningBarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithImportDeckView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.importDeckView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLeaderboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.leaderboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProgressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.progressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserSettingsView({
    _i17.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.userSettingsView,
        arguments: UserSettingsViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
