import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:carteirinha_sistematica/app/widgets/showdialog_usuario.dart';
import 'package:carteirinha_sistematica/app/widgets/usuariosInfoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';
import '../home_store.dart';

class GestorPage extends StatefulWidget {
  const GestorPage({
    Key? key,
  }) : super(key: key);

  @override
  _GestorPageState createState() => _GestorPageState();
}

class _GestorPageState extends State<GestorPage> {
  final HomeStore _controller = Modular.get();

  ShowMToast toast = ShowMToast();

  @override
  void initState() {
    _controller.getUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _controller.getValidatorUser
          ? Container(
              color: Colors.white,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20),
              child: const SpinKitWave(
                color: Color(0xFF0F3671),
                size: 40,
              ))
          :Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Painel Administrativo",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                backgroundColor: Color(0xFF0F3671),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: Observer(
                            builder: (_) => ListView.builder(
                                itemCount: _controller.usuariosList.length,
                                itemBuilder: (context, index) {
                                  UserModel _usuario =
                                  _controller.usuariosList[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: GestureDetector(
                                      child: UsuariosInfoCard(
                                        nome: _usuario.nome,
                                        foto: _usuario.foto,
                                        ativo: _usuario.ativo==false?
                                        "Inativo":"Ativo",
                                        data_validade: _usuario.data_validade.isEmpty?
                                        "Usuario Inátivo": _usuario.data_validade,
                                        matricula: _usuario.matricula,
                                        tipo_socio: _usuario.tipo_socio == 0 ?
                                        "Usuario Inátivo":_controller.transformarPermissaoS( _usuario.tipo_socio),
                                      ),
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context){
                                              return ShowDialogUsuario(
                                                controller:_controller,
                                                nome: _usuario.nome,
                                                foto: _usuario.foto,
                                                ativo: _usuario.ativo,
                                                data_validade: _usuario.data_validade,
                                                matricula: _usuario.matricula,
                                                tipo_socio: _usuario.tipo_socio,
                                                admin: _usuario.admin,
                                                data_nascimento: _usuario.data,
                                                telefone: _usuario.telefone,
                                                user: _usuario,
                                              );
                                            });

                                      },
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
