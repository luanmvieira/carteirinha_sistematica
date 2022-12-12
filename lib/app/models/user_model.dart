
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String nome;
  String matricula;
  String email;
  String data;
  String telefone;
  String password;
  String foto;
  bool ativo;
  bool admin;
  String data_validade;
  int tipo_socio;



  UserModel({
    this.nome = '',
    this.matricula = '',
    this.email = '',
    this.data = '',
    this.telefone = '',
    this.password = '',
    this.foto = '',
    this.ativo = false,
    this.admin = false,
    this.data_validade = '',
    this.tipo_socio = 0,

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
      "ativo"                   : this.ativo,
      "admin"                   : this.admin,
      "data_validade"           : this.data_validade,
      "tipo_socio"              : this.tipo_socio,
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
      ativo: doc['ativo'],
      admin: doc['admin'],
      data_validade: doc['data_validade'],
      tipo_socio: doc['tipo_socio'],
    );
  }
}
