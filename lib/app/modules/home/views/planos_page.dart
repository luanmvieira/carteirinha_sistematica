import 'package:carousel_slider/carousel_slider.dart';
import 'package:carteirinha_sistematica/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanosPage extends StatefulWidget {
  const PlanosPage({Key? key}) : super(key: key);

  @override
  State<PlanosPage> createState() => _PlanosPageState();
}

class _PlanosPageState extends State<PlanosPage> {
  final HomeStore _controller = HomeStore();

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
            padding: const EdgeInsets.only(left: 87.0),
            child: Text(
              "Planos",
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "Plano Sócio",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                            items: [
                              Image.asset(
                                'lib/app/assets/Socio1.jpg',
                              ),
                              Image.asset(
                                'lib/app/assets/Socio2.jpg',
                              ),
                              Image.asset(
                                'lib/app/assets/Socio3.jpg',
                              ),
                            ],
                            options: CarouselOptions(
                              height: 200.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              viewportFraction: 0.9,
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Desconto em produtos e eventos da Atlética Sistemática, Descontos em estabelecimentos parceiro, Sorteios e produtos exclusivos para sócios.",
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(50),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF0F3671)),
                              ),
                              child: Text(
                                "Adquirir",
                                style: GoogleFonts.rhodiumLibre(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              onPressed: ()  async {
                                await launchUrl(Uri.parse("https://mpago.la/2e2tG5o"),
                                  mode: LaunchMode.externalApplication
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Plano Sócio Atleta",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          items: [
                            Image.asset(
                              'lib/app/assets/Atleta1.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta2.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta3.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta4.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta5.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta6.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Atleta7.jpg',
                            ),
                          ],
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.9,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Desconto em produtos e eventos da Atlética Sistemática, Descontos em estabelecimentos parceiros, Sorteios e produtos exclusivos para sócios, Treinos semanais .",
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(50),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF0F3671)),
                              ),
                              child: Text(
                                "Adquirir",
                                style: GoogleFonts.rhodiumLibre(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              onPressed: ()  async {
                                await launchUrl(Uri.parse("https://mpago.la/1KG9kXi"),
                                    mode: LaunchMode.externalApplication
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "Plano Sócio Diretor",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CarouselSlider(
                          items: [
                            Image.asset(
                              'lib/app/assets/Diretor1.jpg',
                            ),
                            Image.asset(
                              'lib/app/assets/Diretor2.jpg',
                            ),
                          ],
                          options: CarouselOptions(
                            height: 200.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            viewportFraction: 0.9,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Desconto em produtos e eventos da Atlética Sistemática, Descontos em estabelecimentos parceiros, Sorteios e produtos exclusivos para sócios, Treinos semanais",
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.80,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(50),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF0F3671)),
                              ),
                              child: Text(
                                "Adquirir",
                                style: GoogleFonts.rhodiumLibre(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              onPressed: ()  async {
                                await launchUrl(Uri.parse("https://mpago.la/1X7PuMx"),
                                    mode: LaunchMode.externalApplication
                                );
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
