// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  late final _$usuarioLoginAtom =
      Atom(name: 'AuthStoreBase.usuarioLogin', context: context);

  @override
  UserModel get usuarioLogin {
    _$usuarioLoginAtom.reportRead();
    return super.usuarioLogin;
  }

  @override
  set usuarioLogin(UserModel value) {
    _$usuarioLoginAtom.reportWrite(value, super.usuarioLogin, () {
      super.usuarioLogin = value;
    });
  }

  late final _$resultLoginAtom =
      Atom(name: 'AuthStoreBase.resultLogin', context: context);

  @override
  bool get resultLogin {
    _$resultLoginAtom.reportRead();
    return super.resultLogin;
  }

  @override
  set resultLogin(bool value) {
    _$resultLoginAtom.reportWrite(value, super.resultLogin, () {
      super.resultLogin = value;
    });
  }

  late final _$progressLoginAtom =
      Atom(name: 'AuthStoreBase.progressLogin', context: context);

  @override
  bool get progressLogin {
    _$progressLoginAtom.reportRead();
    return super.progressLogin;
  }

  @override
  set progressLogin(bool value) {
    _$progressLoginAtom.reportWrite(value, super.progressLogin, () {
      super.progressLogin = value;
    });
  }

  late final _$RealizarLoginAsyncAction =
      AsyncAction('AuthStoreBase.RealizarLogin', context: context);

  @override
  Future<dynamic> RealizarLogin() {
    return _$RealizarLoginAsyncAction.run(() => super.RealizarLogin());
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  bool validatePasswordField(String password) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.validatePasswordField');
    try {
      return super.validatePasswordField(password);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogin: ${usuarioLogin},
resultLogin: ${resultLogin},
progressLogin: ${progressLogin}
    ''';
  }
}
