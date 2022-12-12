import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoFirebaseHome{

  FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  UserModel _userm = UserModel();
  String emailCurrent = "";
  List<UserModel> _userList = [];

  bool checkCurrentUser() {
    User? user = auth.currentUser;
    // emailCurrent = auth.currentUser!.email.toString();
    return user != null ? true : false;
  }

  Future <UserModel> getCurrentUser() async{
        QuerySnapshot _userQuery = await _db.collection("usuarios").where("email", isEqualTo: auth.currentUser!.email).get();
        if(_userQuery.docs.isNotEmpty){
          print("não é vazio doc");
          _userm = UserModel.fromMap(_userQuery.docs.first);
          print("carregou model");
        }else{
          print("não carregou model");
        }
    print("Email: ${_userm.email.toString()}");
    return _userm;
  }
  Future logout() async {
    await auth.signOut();
    return true;
  }
  Future<List<UserModel>> getUserData() async {
    _userList = [];
    QuerySnapshot queryFuncionarios = await _db.collection("usuarios").get();
    for (DocumentSnapshot _doc in queryFuncionarios.docs) {
      UserModel _user = UserModel.fromMap(_doc);
      _userList.add(_user);
    }
    return _userList;
  }
  Future<void> firebaseUpdateFuncionario(UserModel user, String matricula) async {
    await _db.collection('usuarios').doc(matricula).update({
      "nome"         : user.nome,
      "telefone"     : user.telefone,
      "data"         : user.data,
      "ativo"        : user.ativo,
      "admin"        : user.admin,
      "data_validade": user.data_validade,
      "tipo_socio"   : user.tipo_socio,
    });
  }


}