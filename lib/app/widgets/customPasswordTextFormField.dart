import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomPasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final double fontSize;
  final Color iconColor;
  final Color fillColor;
  final Color borderColor;
  final Color fontColor;
  final Function validation;

  const CustomPasswordTextFormField(
  {Key? key,
    required this.controller,
    required this.fontSize,
    required this.fillColor,
    required this.borderColor,
    required this.fontColor,
    required this.iconColor,
    required this.validation,

  }) : super(key: key);

  @override
  _CustomPasswordTextFormFieldState createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool hidePassword = true;




  void showPass() {
    if (hidePassword == true) {
      hidePassword = false;
    } else if (hidePassword == false) {
      hidePassword = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.nunito(
        color: Colors.grey[700],
        fontSize: 17,
      ),
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => widget.validation(value),
      cursorColor: Colors.black,
      controller: widget.controller,
      obscureText: hidePassword,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black),
        hintText: "Senha",
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        alignLabelWithHint: true,
        contentPadding:EdgeInsets.fromLTRB(20, 18, 20, 18),
        suffix: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            child: Text("Mostrar"),
            onTap: () {
              setState(() {
                showPass();
              });
            },
          ),
        ),
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
    );
  }
}
