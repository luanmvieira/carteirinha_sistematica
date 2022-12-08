
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String nome;
  String matricula;
  String email;
  String data;
  String telefone;
  String password;
  String foto;


  UserModel({
    this.nome = '',
    this.matricula = '',
    this.email = '',
    this.data = '',
    this.telefone = '',
    this.password = '',
    this.foto = '',
}
      );

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      "nome"                    : this.nome,
      "matricula"               : this.matricula,
      "email"                   : this.email,
      "data"                    : this.data,
      "telefone"                : this.telefone,
      "foto"                    : this.foto,
    };
    return map;

  }

  factory UserModel.fromMap(DocumentSnapshot doc) {
    return UserModel(
      nome: doc['nome'],
      matricula: doc['matricula'],
      email: doc['email'],
      data: doc['data'],
      telefone: doc['telefone'],
      foto: doc['foto'],
    );
  }
}
