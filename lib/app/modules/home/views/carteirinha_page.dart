import 'package:carteirinha_sistematica/app/widgets/custom_buttom_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';
import '../home_store.dart';

class CarteirinhaPage extends StatefulWidget {
  const CarteirinhaPage({
    Key? key,
  }) : super(key: key);

  @override
  _CarteirinhaPageState createState() => _CarteirinhaPageState();
}

class _CarteirinhaPageState extends State<CarteirinhaPage> {
  final HomeStore _controller = Modular.get();

  ShowMToast toast = ShowMToast();

  @override
  void initState() {
    _controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _controller.getValidator
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
                title: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Carteirinha Sistemática",
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                backgroundColor: Color(0xFF0F3671),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 200),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Color(0xFF0F3671),
                        padding: const EdgeInsets.all(8),
                        height: 220,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                Center(
                                  child: const Text("A. A. A. Sistemas de Informação",
                                    style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0xFF0F3671),
                                          radius: 39,
                                          child:CircleAvatar(
                                            backgroundColor: Color(0xFF0F3671),
                                            radius: 150,
                                            backgroundImage: NetworkImage(
                                                _controller.photoHomeController),
                                          ),
                                        ),
                                        Image.asset(
                                          'lib/app/assets/escudo_atletica.png',
                                          fit: BoxFit.fill,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height * 0.11,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width * 0.25,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _controller.nameHomeController,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Matricula: ${_controller.matriculaHomeController}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          "Data e nascimento : ${_controller.dataHomeController}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text(
                                              "Validade :",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 50,),
                                            Text(
                                              "Tipo de Sócio :",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
