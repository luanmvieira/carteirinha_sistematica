import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:carteirinha_sistematica/app/modules/home/repositories/db_home.dart';
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
  UserModel currentUserModel = UserModel();

  @observable
  String photoHomeController = '';
  @observable
  String nameHomeController = '';
  @observable
  String matriculaHomeController = '';
  @observable
  String dataHomeController = '';
  @observable
  String emailHomeController = '';
  @observable
  String telefoneHomeController = '';


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
    getValidator = false;
  }

  @action
  Future logOut() async {
    logOutstate = await _dbHome.logout();
    if(logOutstate == true){
      Modular.to.navigate("/");
    }else{
    }
  }
}