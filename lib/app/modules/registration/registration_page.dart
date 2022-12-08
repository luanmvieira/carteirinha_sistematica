import 'package:brasil_fields/brasil_fields.dart';
import 'package:carteirinha_sistematica/app/modules/registration/registration_store.dart';
import 'package:carteirinha_sistematica/app/widgets/customPasswordTextFormField.dart';
import 'package:carteirinha_sistematica/app/widgets/registration_default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationStore _controller = RegistrationStore();

  ShowMToast toast = ShowMToast();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _controller.resultCadastro || _controller.uploading?
      Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child:  const SpinKitWave(
            color: Color(0xFF0F3671),
            size: 40,
          )
      ):Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(55.0),
            child: Text(
              "Cadastro",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Observer(
                            builder: (_) => CircleAvatar(
                              backgroundColor: Color(0xFF0F3671),
                              radius: 70,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF0F3671),
                                radius: 150,
                                backgroundImage:
                                _controller.photoController.isEmpty?
                                NetworkImage(_controller.foto):
                                NetworkImage(_controller.photoController),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: GestureDetector(
                                child: Text(
                                  'Envie uma foto',
                                  style: GoogleFonts.rhodiumLibre(
                                      color: Color(0xFF0F3671),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () async {
                                  await _controller.pickAndUploadImage();
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RegistrationDefaultTextField(
                              hintText: "Nome Completo",
                              textInputType: TextInputType.text,
                              controller: _controller.nomeController,
                              validation: (String value) {
                                if (_controller.validateNameField(value) ==
                                    false) {
                                  return 'Insira o seu Nome e Sobrenome';
                                }
                              }),
                          SizedBox(height: 15),
                          RegistrationDefaultTextField(
                              hintText: "Matricula",
                              textInputType: TextInputType.number,
                              maxlengh: 9,
                              controller: _controller.matriculaController,
                              validation: (String value) {
                                if (_controller.validateMatriculaField(value) ==
                                    false) {
                                  return 'Insira a matrícula completa';
                                }
                              }),
                          SizedBox(height: 15),
                          RegistrationDefaultTextField(
                              hintText: "E-mail",
                              textInputType: TextInputType.emailAddress,
                              controller: _controller.emailController,
                              validation: (String value) {
                                if (_controller.validateEmailField(value) ==
                                    false) {
                                  return 'Insira o email correto';
                                }
                              }),
                          SizedBox(height: 15),
                          RegistrationDefaultTextField(
                              hintText: "Data de nascimento",
                              textInputType: TextInputType.number,
                              controller: _controller.dataController,
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                DataInputFormatter()],
                              validation: (String value) {
                                if (_controller.validateDataField(value) ==
                                    false) {
                                  return 'Insira a data completa';
                                }
                              }),
                          SizedBox(height: 15),
                          RegistrationDefaultTextField(
                              hintText: "Telefone",
                              textInputType: TextInputType.number,
                              controller: _controller.telefoneController,
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()],
                              validation: (String value) {
                                if (_controller.validateTelefoneField(value) ==
                                    false) {
                                  return 'Insira Telefone completo';
                                }
                              }),
                          SizedBox(height: 15),
                          CustomPasswordTextFormField(
                            controller: _controller.senhaController,
                            fillColor: Colors.grey,
                            borderColor: Colors.black,
                            fontColor: Colors.black,
                            iconColor: Colors.black,
                            fontSize: 18,
                            validation: (String value) {
                              if (_controller.validatePasswordField(value) ==
                                  false) {
                                return 'A Senha deve conter pelo menos 08 caracteres';
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.07,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.90,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(50),
                              backgroundColor: MaterialStateProperty.all(
                                  Color(0xFF0F3671)),
                            ),
                            child: Text(
                              "Cadastrar",
                              style: GoogleFonts.rhodiumLibre(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            onPressed: () async {
                              if( _controller.nomeController.text.isNotEmpty &&
                                  _controller.matriculaController.text.isNotEmpty &&
                                  _controller.emailController.text.isNotEmpty &&
                                  _controller.dataController.text.isNotEmpty &&
                                  _controller.telefoneController.text.isNotEmpty){
                                if(_controller.photoController.isEmpty){
                                  toast.errorToast(context,
                                      message: "Adicione a Foto",
                                      alignment: Alignment.topCenter);
                                }else{
                                  await _controller.CadastrarUser();
                                  if (_controller.resultUsuario == true) {
                                    toast.successToast(
                                        context,
                                        message: "Cadastro efetuado com sucesso",
                                        alignment: Alignment.topCenter);
                                    Modular.to.navigate('/');
                                  }else{
                                    toast.errorToast(context,
                                        message: "Erro ao realizar cadastro, verifique os dados e tente novamente!",
                                        alignment: Alignment.topCenter);
                                  }
                                }
                              }else{
                                toast.errorToast(context,
                                    message: "Complete todos os dados",
                                    alignment: Alignment.topCenter);
                              }
                            })
                      ),
                    ),
                  const SizedBox(
                    height: 20,
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
