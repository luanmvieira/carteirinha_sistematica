import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsuariosInfoCard extends StatelessWidget {
  final String nome;
  final String matricula;
  final String ativo;
  final String data_validade;
  final String tipo_socio;
  final String foto;

  const UsuariosInfoCard({Key? key,
    required this.nome,
    required this.ativo,
    required this.data_validade,
    required this.tipo_socio,
    required this.matricula,
    required this.foto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        color: Color(0xFF0F3671),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Container(width: 3),
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color(0xFF0F3671),
                radius: 40,
                child:CircleAvatar(
                  backgroundColor: Color(0xFF0F3671),
                  radius: 150,
                  backgroundImage: NetworkImage(foto),
                ),
              ),
            ),
            SizedBox(
              child: Container(width: 10),
            ),
            Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nome: $nome",
                      textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 13,
                  color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text("Matricula: $matricula",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 13,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(ativo,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 13,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,)
                  ),
                  Text("Data de Validade: $data_validade",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,)
                  ),
                  Text("Tipo de Socio: $tipo_socio",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 13,
                          color: Colors.white,
                        fontWeight: FontWeight.bold,)
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
