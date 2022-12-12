import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:carteirinha_sistematica/app/modules/home/repositories/db_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ConexaoFirebaseHome _dbHome = ConexaoFirebaseHome();

  @observable
  bool logOutstate = false;
  @observable
  bool getValidator = false;
  @observable
  bool getValidatorSet = false;
  @observable
  bool getValidatorUser = false;
  @observable
  UserModel currentUserModel = UserModel();
  @observable
  List<UserModel> usuariosList = [];
  @observable
  List <String> listSocio = ["Sócio", "Sócio Atleta", "Sócio Diretor"];
  @observable
  List <String> listAtivo = ["Ativo", "Inativo"];
  @observable
  List <String> listAdmin = ["Associado", "Administrador"];


  @observable
  String photoHomeController = '';
  @observable
  String nameHomeController = '';
  @observable
  String matriculaHomeController = '';
  @observable
  String dataHomeController = '';
  @observable
  String dataValidadeHomeController = '';
  @observable
  String emailHomeController = '';
  @observable
  String telefoneHomeController = '';
  @observable
  bool ativoHomeController = false;
  @observable
  bool adminHomeController = false;
  @observable
  int tipoSocioHomeController = 0;
  @observable
  String tipoSocioHomeControllerString = '';


  @observable
  TextEditingController updateNameHomeController = TextEditingController();
  @observable
  TextEditingController updateMatriculaHomeController = TextEditingController();
  @observable
  TextEditingController updateDataHomeController = TextEditingController();
  @observable
  TextEditingController updateEmailHomeController = TextEditingController();
  @observable
  TextEditingController updateTelefoneHomeController = TextEditingController();
  @observable
  bool updateAtivoHomeController = false;
  @observable
  bool updateAdminHomeController = false;
  @observable
  TextEditingController updateDataVencimentoHomeController = TextEditingController();
  @observable
  int updateTipoSocioHomeController = 0;


  @action
  Future<void> getUsuarios() async {
    getValidatorUser = true;
    usuariosList = await _dbHome.getUserData();
    getValidatorUser = false;
  }

  @action
  Future<void> getCurrentUser() async {
    getValidator = true;
    currentUserModel = await _dbHome.getCurrentUser();
    nameHomeController = currentUserModel.nome;
    photoHomeController = currentUserModel.foto;
    matriculaHomeController = currentUserModel.matricula;
    dataHomeController = currentUserModel.data;
    emailHomeController = currentUserModel.email;
    telefoneHomeController = currentUserModel.telefone;
    ativoHomeController = currentUserModel.ativo;
    adminHomeController = currentUserModel.admin;
    dataValidadeHomeController = currentUserModel.data_validade;
    tipoSocioHomeControllerString = transformarPermissaoS(currentUserModel.tipo_socio);

    getValidator = false;
  }
  @action
  Future<void> setUser(UserModel user) async {
    getValidatorSet = true;
    updateNameHomeController.text = user.nome;
    updateMatriculaHomeController.text = user.matricula;
    updateDataHomeController.text = user.data;
    updateEmailHomeController.text = user.email;
    updateTelefoneHomeController.text = user.telefone;
    updateAtivoHomeController = user.ativo;
    updateAdminHomeController = user.admin;
    updateDataVencimentoHomeController.text = user.data_validade;
    updateTipoSocioHomeController = user.tipo_socio;

    getValidatorSet = false;
  }
  @action
  Future<void> updateUsuarios(UserModel userModel, String matricula) async {
    _dbHome.firebaseUpdateFuncionario(userModel, matricula);
  }

  @action
  Future logOut() async {
    logOutstate = await _dbHome.logout();
    if(logOutstate == true){
      Modular.to.navigate("/");
    }else{
    }
  }
  @action
  transformarPermissaoS(int permissao1) {
    if (permissao1 == 1) {
      return "Sócio";
    } else if (permissao1 == 2) {
      return "Sócio Atleta";
    } else if (permissao1 == 3) {
      return "Sócio Diretor";
    }else
      return "Não possui plano";
  }

  @action
  transformarPermissao(String permissao) {
    if (permissao == "Sócio") {
      return 1;
    } else if (permissao == "Sócio Atleta") {
      return 2;
    } else if (permissao == "Sócio Diretor") {
      return 3;
    }
  }
  @action
  transformarPermissaoSAtivo(bool permissao1) {
    if (permissao1 == true) {
      return "Ativo";
    } else if (permissao1 == false) {
      return "Inativo";
    }
  }

  @action
  transformarPermissaoAtivo(String permissao) {
    if (permissao == "Ativo") {
      return true;
    } else if (permissao == "Inativo") {
      return false;
    }
  }
  @action
  transformarPermissaoSAdmin(bool permissao1) {
    if (permissao1 == true) {
      return "Administrador";
    } else if (permissao1 == false) {
      return "Associado";
    }
  }

  @action
  transformarPermissaoAdmin(String permissao) {
    if (permissao == "Administrador") {
      return true;
    } else if (permissao == "Associado") {
      return false;
    }
  }



  bool validateNameField(String name) {
    if (name != null && name.length != 0 && name.length > 6) return true;

    return false;
  }
  bool validateMatriculaField(String name) {
    if (name != null && name.length != 0 && name.length > 8) return true;

    return false;
  }
  bool validateDataField(String name) {
    if (name != null && name.length != 0 && name.length > 9) return true;

    return false;
  }
  bool validateTelefoneField(String name) {
    if (name != null && name.length != 0 && name.length > 14) return true;

    return false;
  }
}