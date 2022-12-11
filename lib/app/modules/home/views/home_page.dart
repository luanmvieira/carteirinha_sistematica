import 'package:carteirinha_sistematica/app/widgets/custom_buttom_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_toast/m_toast.dart';
import '../home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          : Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: Text(
                        "Sócio Sistemático",
                        style: GoogleFonts.montserrat(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      child: Icon(Icons.exit_to_app_rounded),
                      onTap: () async {
                        await _controller.logOut();
                      },
                    )
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
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF0F3671),
                                  radius: 70,
                                  child:CircleAvatar(
                                    backgroundColor: Color(0xFF0F3671),
                                    radius: 150,
                                    backgroundImage: NetworkImage(
                                        _controller.photoHomeController),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  _controller.nameHomeController,
                                  style: GoogleFonts.rhodiumLibre(
                                      color: Color(0xFF0F3671),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                const CustomButtomHome(
                                  label: "Visualizar Carteirinha",
                                  route: "/home/carteirinha",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                const CustomButtomHome(
                                  label: "Ver dados",
                                  route: "/home/profile",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                const CustomButtomHome(
                                  label: "Planos",
                                  route: "/home/planos",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _controller.adminHomeController?
                                const CustomButtomHome(
                                  label: "Painel Administrativo",
                                  route: "/home/gestor",
                                ):Container()
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
