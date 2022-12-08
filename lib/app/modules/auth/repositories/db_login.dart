import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ConexaoFirebaseLogin {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> getUserData(String userlogin) async {
    UserModel _user = UserModel();
    QuerySnapshot _userQueryEmail = await _db.collection("usuarios").where("email", isEqualTo: userlogin).get();
    QuerySnapshot _userQueryMatricula = await _db.collection("usuarios").where("matricula", isEqualTo: userlogin).get();
    if(_userQueryEmail.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQueryEmail.docs.first);
      print("carregou o usermodel - email");
    }
    if(_userQueryMatricula.docs.isNotEmpty){
      print("não é vazio");
      _user = UserModel.fromMap(_userQueryMatricula.docs.first);
      print("carregou o usermodel - matricula");
    }
    return _user;
  }

  Future logarUsuario(UserModel user) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return true;
    } catch (error) {
      print("Logar usuario: erro " + error.toString());
    }
  }

  Future logout() async {
    await auth.signOut();
    return true;
  }
}
