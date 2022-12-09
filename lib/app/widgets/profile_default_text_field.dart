import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDefaultTextField extends StatelessWidget {
  final Function? onTapPassword;
  final TextInputType textInputType;
  final String controller;
  final List<TextInputFormatter>? textInputFormatter;
  final Icon icon;

  const ProfileDefaultTextField(
      {Key? key,
        required this.textInputType,
        required this.controller,
        this.onTapPassword,
        this.textInputFormatter,
        required this.icon,


      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: controller,
      style: GoogleFonts.nunito(
        color: Colors.black,
        fontSize: 17,
      ),
      enabled: false,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        icon: icon,
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        alignLabelWithHint: true,
        contentPadding:EdgeInsets.fromLTRB(20, 18, 20, 18),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: Colors.grey,
          ), //Color(0xff1a1919)
        ),
      ),
    );
  }
}
