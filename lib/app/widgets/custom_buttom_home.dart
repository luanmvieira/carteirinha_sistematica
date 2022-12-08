import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtomHome extends StatelessWidget {
  final String label;
  final String route;
  const CustomButtomHome({Key? key,
    required this.label,
    required this.route}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
              label,
              style: GoogleFonts.rhodiumLibre(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () {
              Modular.to.pushNamed("$route");
            }),
      ),
    );
  }
}
