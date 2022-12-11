// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$logOutstateAtom =
      Atom(name: 'HomeStoreBase.logOutstate', context: context);

  @override
  bool get logOutstate {
    _$logOutstateAtom.reportRead();
    return super.logOutstate;
  }

  @override
  set logOutstate(bool value) {
    _$logOutstateAtom.reportWrite(value, super.logOutstate, () {
      super.logOutstate = value;
    });
  }

  late final _$getValidatorAtom =
      Atom(name: 'HomeStoreBase.getValidator', context: context);

  @override
  bool get getValidator {
    _$getValidatorAtom.reportRead();
    return super.getValidator;
  }

  @override
  set getValidator(bool value) {
    _$getValidatorAtom.reportWrite(value, super.getValidator, () {
      super.getValidator = value;
    });
  }

  late final _$getValidatorUserAtom =
      Atom(name: 'HomeStoreBase.getValidatorUser', context: context);

  @override
  bool get getValidatorUser {
    _$getValidatorUserAtom.reportRead();
    return super.getValidatorUser;
  }

  @override
  set getValidatorUser(bool value) {
    _$getValidatorUserAtom.reportWrite(value, super.getValidatorUser, () {
      super.getValidatorUser = value;
    });
  }

  late final _$currentUserModelAtom =
      Atom(name: 'HomeStoreBase.currentUserModel', context: context);

  @override
  UserModel get currentUserModel {
    _$currentUserModelAtom.reportRead();
    return super.currentUserModel;
  }

  @override
  set currentUserModel(UserModel value) {
    _$currentUserModelAtom.reportWrite(value, super.currentUserModel, () {
      super.currentUserModel = value;
    });
  }

  late final _$usuariosListAtom =
      Atom(name: 'HomeStoreBase.usuariosList', context: context);

  @override
  List<UserModel> get usuariosList {
    _$usuariosListAtom.reportRead();
    return super.usuariosList;
  }

  @override
  set usuariosList(List<UserModel> value) {
    _$usuariosListAtom.reportWrite(value, super.usuariosList, () {
      super.usuariosList = value;
    });
  }

  late final _$photoHomeControllerAtom =
      Atom(name: 'HomeStoreBase.photoHomeController', context: context);

  @override
  String get photoHomeController {
    _$photoHomeControllerAtom.reportRead();
    return super.photoHomeController;
  }

  @override
  set photoHomeController(String value) {
    _$photoHomeControllerAtom.reportWrite(value, super.photoHomeController, () {
      super.photoHomeController = value;
    });
  }

  late final _$nameHomeControllerAtom =
      Atom(name: 'HomeStoreBase.nameHomeController', context: context);

  @override
  String get nameHomeController {
    _$nameHomeControllerAtom.reportRead();
    return super.nameHomeController;
  }

  @override
  set nameHomeController(String value) {
    _$nameHomeControllerAtom.reportWrite(value, super.nameHomeController, () {
      super.nameHomeController = value;
    });
  }

  late final _$matriculaHomeControllerAtom =
      Atom(name: 'HomeStoreBase.matriculaHomeController', context: context);

  @override
  String get matriculaHomeController {
    _$matriculaHomeControllerAtom.reportRead();
    return super.matriculaHomeController;
  }

  @override
  set matriculaHomeController(String value) {
    _$matriculaHomeControllerAtom
        .reportWrite(value, super.matriculaHomeController, () {
      super.matriculaHomeController = value;
    });
  }

  late final _$dataHomeControllerAtom =
      Atom(name: 'HomeStoreBase.dataHomeController', context: context);

  @override
  String get dataHomeController {
    _$dataHomeControllerAtom.reportRead();
    return super.dataHomeController;
  }

  @override
  set dataHomeController(String value) {
    _$dataHomeControllerAtom.reportWrite(value, super.dataHomeController, () {
      super.dataHomeController = value;
    });
  }

  late final _$emailHomeControllerAtom =
      Atom(name: 'HomeStoreBase.emailHomeController', context: context);

  @override
  String get emailHomeController {
    _$emailHomeControllerAtom.reportRead();
    return super.emailHomeController;
  }

  @override
  set emailHomeController(String value) {
    _$emailHomeControllerAtom.reportWrite(value, super.emailHomeController, () {
      super.emailHomeController = value;
    });
  }

  late final _$telefoneHomeControllerAtom =
      Atom(name: 'HomeStoreBase.telefoneHomeController', context: context);

  @override
  String get telefoneHomeController {
    _$telefoneHomeControllerAtom.reportRead();
    return super.telefoneHomeController;
  }

  @override
  set telefoneHomeController(String value) {
    _$telefoneHomeControllerAtom
        .reportWrite(value, super.telefoneHomeController, () {
      super.telefoneHomeController = value;
    });
  }

  late final _$ativoHomeControllerAtom =
      Atom(name: 'HomeStoreBase.ativoHomeController', context: context);

  @override
  bool get ativoHomeController {
    _$ativoHomeControllerAtom.reportRead();
    return super.ativoHomeController;
  }

  @override
  set ativoHomeController(bool value) {
    _$ativoHomeControllerAtom.reportWrite(value, super.ativoHomeController, () {
      super.ativoHomeController = value;
    });
  }

  late final _$adminHomeControllerAtom =
      Atom(name: 'HomeStoreBase.adminHomeController', context: context);

  @override
  bool get adminHomeController {
    _$adminHomeControllerAtom.reportRead();
    return super.adminHomeController;
  }

  @override
  set adminHomeController(bool value) {
    _$adminHomeControllerAtom.reportWrite(value, super.adminHomeController, () {
      super.adminHomeController = value;
    });
  }

  late final _$getUsuariosAsyncAction =
      AsyncAction('HomeStoreBase.getUsuarios', context: context);

  @override
  Future<void> getUsuarios() {
    return _$getUsuariosAsyncAction.run(() => super.getUsuarios());
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('HomeStoreBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$logOutAsyncAction =
      AsyncAction('HomeStoreBase.logOut', context: context);

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
logOutstate: ${logOutstate},
getValidator: ${getValidator},
getValidatorUser: ${getValidatorUser},
currentUserModel: ${currentUserModel},
usuariosList: ${usuariosList},
photoHomeController: ${photoHomeController},
nameHomeController: ${nameHomeController},
matriculaHomeController: ${matriculaHomeController},
dataHomeController: ${dataHomeController},
emailHomeController: ${emailHomeController},
telefoneHomeController: ${telefoneHomeController},
ativoHomeController: ${ativoHomeController},
adminHomeController: ${adminHomeController}
    ''';
  }
}
