import 'package:carteirinha_sistematica/app/modules/auth/auth_store.dart';
import 'package:carteirinha_sistematica/app/widgets/customPasswordTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';


class Auth_page extends StatefulWidget {
  const Auth_page({Key? key}) : super(key: key);

  @override
  State<Auth_page> createState() => _Auth_pageState();
}

class _Auth_pageState extends State<Auth_page> {
  final AuthStore controller = Modular.get();
  ShowMToast toast = ShowMToast();
  @override
  void initState() {
    controller.checkCurrentUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => controller.progressLogin?
      Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child:  const SpinKitWave(
            color: Color(0xFF0F3671),
            size: 40,
          )
      ): GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Carteirinha Sistemática',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Color(0xFF0F3671),

          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                ),
                Image.asset(
                  'lib/app/assets/escudo_atletica.png',
                  fit: BoxFit.fill,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.40,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.70,
                ),
                Text("Login",
                  style: GoogleFonts.inter(
                    color: Color(0xFF0F3671),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: controller.loginUserController,
                    style: GoogleFonts.nunito(
                      color: Colors.grey[700],
                      fontSize: 17,
                    ),
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: "E-mail ou matricula",
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.6),
                      alignLabelWithHint: true,
                      contentPadding:EdgeInsets.fromLTRB(20, 18, 20, 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                          width: 1.18,
                          color: Color(0xff1a1919),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide(
                          width: 1.2,
                          color: Colors.black,
                        ), //Color(0xff1a1919)
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomPasswordTextFormField(
                    controller: controller.loginPasswordController,
                    fillColor: Colors.grey,
                    borderColor: Colors.black,
                    fontColor: Colors.black,
                    iconColor: Colors.black,
                    fontSize: 18,
                    validation: (String value) {
                      if (controller.validatePasswordField(value) == false) {
                        return 'A Senha deve conter pelo menos 08 caracteres';
                      }
                    },
                  ),
                ),
                Container(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.05,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.85,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(50),
                          backgroundColor: MaterialStateProperty.all(
                              Color(0xFF0F3671)),
                        ),
                        child: Text(
                            "Login",
                            style: GoogleFonts.rhodiumLibre(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        onPressed: () async {
                          await controller.RealizarLogin();
                          if(controller.resultLogin == true){
                            Modular.to.navigate("/home/");
                            Fluttertoast.showToast(
                                msg: "Logado com sucesso",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 12.0
                            );
                          }else{
                            Fluttertoast.showToast(
                                msg: "Revise suas credênciais",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 12.0
                            );
                          }

                        }),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: GestureDetector(
                      child: Text(
                        'Cadastre-se',
                        style: GoogleFonts.rhodiumLibre(
                            color: Color(0xFF0F3671),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Modular.to.pushNamed("/registration");
                      },
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
