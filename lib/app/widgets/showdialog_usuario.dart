import 'package:carteirinha_sistematica/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDialogUsuario extends StatefulWidget {
  final String nome;
  final String matricula;
  final String data_nascimento;
  final String telefone;
  final String tipo_socio;
  final String foto;
  final bool ativo;
  final bool admin;
  final String data_validade;
  final HomeStore controller;

  @override
  _ShowDialogUsuarioState createState() => _ShowDialogUsuarioState();

  const ShowDialogUsuario({
    Key? key,
    required this.nome,
    required this.matricula,
    required this.data_nascimento,
    required this.telefone,
    required this.tipo_socio,
    required this.ativo,
    required this.admin,
    required this.data_validade,
    required this.controller,
    required this.foto,
  }) : super(key: key);
}

class _ShowDialogUsuarioState extends State<ShowDialogUsuario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => widget.controller.getValidatorUser
          ? SpinKitFadingCircle(
              color: Colors.white,
              size: 40,
            )
          : Container(
              width: 300,
              child: AlertDialog(
                backgroundColor: Color(0xFF0F3671),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                content: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff161621),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                color: Colors.white,
                              ),
                              Text(
                                widget.nome,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  disabledColor: Colors.transparent,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Observer(
                                          builder: (_) => CircleAvatar(
                                              backgroundColor:
                                                  Color(0xff161621),
                                              radius: 60,
                                              backgroundImage: NetworkImage(widget.foto)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, right: 22),
                                child: Container(
                                  width: 400,
                                  height: MediaQuery.of(context).size.height,
                                  child: NotificationListener<
                                      OverscrollIndicatorNotification>(
                                    onNotification:
                                        (OverscrollIndicatorNotification
                                            overscroll) {
                                      overscroll.disallowGlow();
                                      return true; // or false
                                    },
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 45),
                                            child: Text(
                                              "Nome",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.openSans(
                                                fontSize: 20,
                                                color: Colors.white,
                                                //color: Color.fromRGBO(33, 150, 243,1),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35),
                                            child: Text(
                                              "Email",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.openSans(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35),
                                            child: Text(
                                              "Telefone",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.openSans(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35),
                                            child: Text(
                                              "Cargo:",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.openSans(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff161621),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Observer(
                          builder: (_) => widget.controller.getValidatorUser
                              ? SpinKitWave(
                                  color: Colors.white,
                                  size: 40,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: () async {

                                      },
                                      child: Text(
                                        "Aceitar",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
