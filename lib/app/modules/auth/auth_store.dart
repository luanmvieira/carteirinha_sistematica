import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:carteirinha_sistematica/app/modules/auth/repositories/db_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  FirebaseAuth auth = FirebaseAuth.instance;
  ConexaoFirebaseLogin dblogin = ConexaoFirebaseLogin();


  final loginUserController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @observable
  UserModel usuarioLogin = UserModel();
  @observable
  bool resultLogin = false;
  @observable
  bool progressLogin = false;

  @action
  Future RealizarLogin() async {
    progressLogin = true;
    usuarioLogin = await dblogin.getUserData(loginUserController.text);
    usuarioLogin.email = usuarioLogin.email;
    usuarioLogin.password = loginPasswordController.text;
    resultLogin = await dblogin.logarUsuario(usuarioLogin);
    progressLogin = false;
    }


  @action
  bool validatePasswordField(String password) {
    if (password != null && password.length != 0 && password.length >= 8)
      return true;

    return false;
  }
}