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
currentUserModel: ${currentUserModel},
nameHomeController: ${nameHomeController},
photoHomeController: ${photoHomeController}
    ''';
  }
}
