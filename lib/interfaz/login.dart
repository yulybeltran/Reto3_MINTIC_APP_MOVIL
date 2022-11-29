import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../proceso/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final email = TextEditingController();
final password = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Kamej  Login__Registro",
          style: GoogleFonts.chewy(),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image(
                  image: NetworkImage(
                      "https://us.123rf.com/450wm/blankstock/blankstock2209/blankstock220902911/191683676-neon-light-speech-bubble-messenger-line-icon-speech-bubble-sign-chat-message-symbol-neon-light-backg.jpg?ver=6")),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "E-mail", suffixIcon: Icon(Icons.mark_email_unread)),
                style: GoogleFonts.chewy(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    hintText: "Password", suffixIcon: Icon(Icons.key_outlined)),
                style: GoogleFonts.chewy(),
              ),
            ),
            Divider(),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion().IniciarSesion(
                      email: email.text, password: password.text);
                },
                icon: Icon(Icons.login_rounded),
                label: Text("Iniciar Sesion",style: GoogleFonts.chewy(),)),
            Divider(),
            Divider(),
            ElevatedButton.icon(
                onPressed: () {
                  Autenticacion()
                      .CrearUsuario(email: email.text, password: password.text);
                },
                icon: Icon(Icons.person_add),
                label: Text("Registrar Usuarios",style: GoogleFonts.chewy(),))
          ],
        ),
      ),
    );
  }
}
