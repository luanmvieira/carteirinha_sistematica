// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on RegistrationStoreBase, Store {
  late final _$photoControllerAtom =
      Atom(name: 'RegistrationStoreBase.photoController', context: context);

  @override
  String get photoController {
    _$photoControllerAtom.reportRead();
    return super.photoController;
  }

  @override
  set photoController(String value) {
    _$photoControllerAtom.reportWrite(value, super.photoController, () {
      super.photoController = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'RegistrationStoreBase.image', context: context);

  @override
  XFile? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(XFile? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$uploadingAtom =
      Atom(name: 'RegistrationStoreBase.uploading', context: context);

  @override
  bool get uploading {
    _$uploadingAtom.reportRead();
    return super.uploading;
  }

  @override
  set uploading(bool value) {
    _$uploadingAtom.reportWrite(value, super.uploading, () {
      super.uploading = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: 'RegistrationStoreBase.usuario', context: context);

  @override
  UserModel get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UserModel value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$resultUsuarioAtom =
      Atom(name: 'RegistrationStoreBase.resultUsuario', context: context);

  @override
  bool get resultUsuario {
    _$resultUsuarioAtom.reportRead();
    return super.resultUsuario;
  }

  @override
  set resultUsuario(bool value) {
    _$resultUsuarioAtom.reportWrite(value, super.resultUsuario, () {
      super.resultUsuario = value;
    });
  }

  late final _$textResultAtom =
      Atom(name: 'RegistrationStoreBase.textResult', context: context);

  @override
  String get textResult {
    _$textResultAtom.reportRead();
    return super.textResult;
  }

  @override
  set textResult(String value) {
    _$textResultAtom.reportWrite(value, super.textResult, () {
      super.textResult = value;
    });
  }

  late final _$resultCadastroAtom =
      Atom(name: 'RegistrationStoreBase.resultCadastro', context: context);

  @override
  bool get resultCadastro {
    _$resultCadastroAtom.reportRead();
    return super.resultCadastro;
  }

  @override
  set resultCadastro(bool value) {
    _$resultCadastroAtom.reportWrite(value, super.resultCadastro, () {
      super.resultCadastro = value;
    });
  }

  late final _$CadastrarUserAsyncAction =
      AsyncAction('RegistrationStoreBase.CadastrarUser', context: context);

  @override
  Future CadastrarUser() {
    return _$CadastrarUserAsyncAction.run(() => super.CadastrarUser());
  }

  late final _$getImageAsyncAction =
      AsyncAction('RegistrationStoreBase.getImage', context: context);

  @override
  Future<XFile?> getImage() {
    return _$getImageAsyncAction.run(() => super.getImage());
  }

  late final _$uploadAsyncAction =
      AsyncAction('RegistrationStoreBase.upload', context: context);

  @override
  Future<UploadTask> upload(String path) {
    return _$uploadAsyncAction.run(() => super.upload(path));
  }

  late final _$pickAndUploadImageAsyncAction =
      AsyncAction('RegistrationStoreBase.pickAndUploadImage', context: context);

  @override
  Future pickAndUploadImage() {
    return _$pickAndUploadImageAsyncAction
        .run(() => super.pickAndUploadImage());
  }

  @override
  String toString() {
    return '''
photoController: ${photoController},
image: ${image},
uploading: ${uploading},
usuario: ${usuario},
resultUsuario: ${resultUsuario},
textResult: ${textResult},
resultCadastro: ${resultCadastro}
    ''';
  }
}
