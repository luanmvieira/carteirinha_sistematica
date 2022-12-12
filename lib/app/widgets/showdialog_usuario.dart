import 'package:brasil_fields/brasil_fields.dart';
import 'package:carteirinha_sistematica/app/models/user_model.dart';
import 'package:carteirinha_sistematica/app/modules/home/home_store.dart';
import 'package:carteirinha_sistematica/app/widgets/registration_default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDialogUsuario extends StatefulWidget {
  final String nome;
  final String matricula;
  final String data_nascimento;
  final String telefone;
  final int tipo_socio;
  final String foto;
  final bool ativo;
  final bool admin;
  final String data_validade;
  final HomeStore controller;
  final UserModel user;

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
    required this.user,
  }) : super(key: key);
}

class _ShowDialogUsuarioState extends State<ShowDialogUsuario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    widget.controller.setUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => widget.controller.getValidatorSet
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
                      height: 45,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width:49),
                              Text(
                                widget.nome,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
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
                                      CircleAvatar(
                                              backgroundColor:
                                                  Color(0xff161621),
                                              radius: 60,
                                              backgroundImage: NetworkImage(widget.foto),
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
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RegistrationDefaultTextField(
                                              hintText: "Nome Completo",
                                              textInputType: TextInputType.text,
                                              controller: widget.controller.updateNameHomeController,
                                              validation: (String value) {
                                                if (widget.controller.validateNameField(value) ==
                                                    false) {
                                                  return 'Insira o seu Nome e Sobrenome';
                                                }
                                              }),
                                          SizedBox(height: 10),
                                          RegistrationDefaultTextField(
                                              hintText: "Data de nascimento",
                                              textInputType: TextInputType.number,
                                              controller: widget.controller.updateDataHomeController,
                                              textInputFormatter: [
                                                FilteringTextInputFormatter.digitsOnly,
                                                DataInputFormatter()],
                                              validation: (String value) {
                                                if (widget.controller.validateDataField(value) ==
                                                    false) {
                                                  return 'Insira a data completa';
                                                }
                                              }),
                                          SizedBox(height: 10),
                                          RegistrationDefaultTextField(
                                              hintText: "Telefone",
                                              textInputType: TextInputType.number,
                                              controller: widget.controller.updateTelefoneHomeController,
                                              textInputFormatter: [
                                                FilteringTextInputFormatter.digitsOnly,
                                                TelefoneInputFormatter()],
                                              validation: (String value) {
                                                if (widget.controller.validateTelefoneField(value) ==
                                                    false) {
                                                  return 'Insira Telefone completo';
                                                }
                                              }),
                                          SizedBox(height: 10,),
                                          DropdownButtonFormField<String>(
                                            items: widget.controller.listAdmin.map((String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 18),
                                                ),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              widget.controller.transformarPermissaoSAdmin(widget.controller
                                                  .updateAdminHomeController),
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            dropdownColor: Color(0xFF0F3671),
                                            onChanged: (value) {
                                              widget.controller.updateAdminHomeController =
                                                  widget.controller.transformarPermissaoAdmin(value!);
                                            },
                                          ),
                                          SizedBox(height: 10),
                                          DropdownButtonFormField<String>(
                                            items: widget.controller.listAtivo.map((String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 18),
                                                ),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              widget.controller.transformarPermissaoSAtivo(widget.controller
                                                  .updateAtivoHomeController),
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            dropdownColor: Color(0xFF0F3671),
                                            onChanged: (value) {
                                              widget.controller.updateAtivoHomeController =
                                                  widget.controller.transformarPermissaoAtivo(value!);
                                            },
                                          ),
                                          SizedBox(height: 10,),
                                          widget.controller.updateAtivoHomeController?
                                          DropdownButtonFormField<String>(
                                            validator: (value) {
                                              if (widget.controller.updateTipoSocioHomeController ==
                                                  0) {
                                                return "Selecione Tipo de Sócio";
                                              }
                                              return null;
                                            },
                                            items: widget.controller.listSocio.map((String value) {
                                              return new DropdownMenuItem(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: GoogleFonts
                                                      .montserrat(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 18),
                                                ),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              widget.controller.transformarPermissaoS(widget.controller
                                                  .updateTipoSocioHomeController),
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                            dropdownColor: Color(0xFF0F3671),
                                            onChanged: (value) {
                                              widget.controller.updateTipoSocioHomeController =
                                                  widget.controller.transformarPermissao(value!);
                                            },
                                          ):Container(),
                                          SizedBox(height: 10,),
                                          widget.controller.updateAtivoHomeController?
                                          RegistrationDefaultTextField(
                                              hintText: "Data de Validade",
                                              textInputType: TextInputType.number,
                                              controller: widget.controller.updateDataVencimentoHomeController,
                                              textInputFormatter: [
                                                FilteringTextInputFormatter.digitsOnly,
                                                DataInputFormatter()],
                                              validation: (String value) {
                                                if (widget.controller.validateDataField(value) ==
                                                    false) {
                                                  return 'Insira a data completa';
                                                }
                                              }):Container(),
                                          SizedBox(height: 10),
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
                      height: 40,
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
                                        UserModel _usuario = UserModel(
                                          nome: widget.controller.updateNameHomeController.text,
                                          data: widget.controller.updateDataHomeController.text,
                                          telefone: widget.controller.updateTelefoneHomeController.text,
                                          admin: widget.controller.updateAdminHomeController,
                                          ativo: widget.controller.updateAtivoHomeController,
                                          tipo_socio: widget.controller.updateTipoSocioHomeController,
                                          data_validade: widget.controller.updateDataVencimentoHomeController.text,
                                        );
                                        print(widget.matricula);
                                        await widget.controller.updateUsuarios(_usuario, widget.matricula).whenComplete(
                                              () => Fluttertoast.showToast(
                                                msg: "Editado com Sucesso",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.green,
                                                textColor: Colors.white,
                                                fontSize: 12.0
                                            ),
                                        );
                                        await widget.controller.getUsuarios();
                                        Navigator.of(context).pop();

                                      },
                                      child: Text(
                                        "Salvar",
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
