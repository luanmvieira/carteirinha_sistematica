import 'package:carteirinha_sistematica/app/modules/home/home_store.dart';
import 'package:carteirinha_sistematica/app/widgets/profile_default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HomeStore _controller = HomeStore();

  ShowMToast toast = ShowMToast();

  @override
  void initState() {
    _controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _controller.getValidator?
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
            padding: const EdgeInsets.all(45.0),
            child: Text(
              "Dados Cadastrais",
              style: GoogleFonts.montserrat(
                fontSize: 20,
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
                                NetworkImage(_controller.photoHomeController),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ProfileDefaultTextField(
                              textInputType: TextInputType.text,
                              controller: _controller.nameHomeController,
                              icon: Icon(Icons.person),
                              ),
                          SizedBox(height: 15),
                          ProfileDefaultTextField(
                            textInputType: TextInputType.number,
                              controller: _controller.matriculaHomeController,
                              icon: Icon(Icons.laptop_chromebook),
                              ),
                          SizedBox(height: 15),
                          ProfileDefaultTextField(
                              textInputType: TextInputType.emailAddress,
                              controller: _controller.emailHomeController,
                            icon: Icon(Icons.email),
                              ),
                          SizedBox(height: 15),
                          ProfileDefaultTextField(
                              textInputType: TextInputType.number,
                              controller: _controller.dataHomeController,
                              icon: Icon(Icons.date_range_sharp),
                              ),
                          SizedBox(height: 15),
                          ProfileDefaultTextField(
                              textInputType: TextInputType.number,
                              controller: _controller.telefoneHomeController,
                              icon: Icon(Icons.phone),
                          ),
                          SizedBox(height: 15),
                          Text(
                              "Para sua segurança, dados como matricula, e-mail e telefone só poderão ser alterados enviando um e-mail para contatosistemaricos@gmail.com .",
                          textAlign: TextAlign.justify,
                          ),

                        ],
                      ),
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
