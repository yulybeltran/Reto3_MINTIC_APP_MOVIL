import 'package:chat_reto3/interfaz/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../mensajes.dart';
import '../proceso/autenticacion.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Autenticacion().CerrarSesion();
                    email.clear();
                    password.clear();
                  },
                  icon: Icon(Icons.logout)),
              VerticalDivider(),
              Text((Autenticacion().usuarios?.email).toString(),
                  style: GoogleFonts.chewy())
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: mensaje,
                      decoration: InputDecoration(hintText: "Mensaje..."),
                      style: GoogleFonts.chewy(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        if (mensaje.text.isNotEmpty) {
                          fire.collection("Chat").doc().set({
                            "mensaje": mensaje.text,
                            "tiempo": DateTime.now(),
                            "email":
                                (Autenticacion().usuarios?.email).toString(),
                          });

                          mensaje.clear();
                        }
                      },
                      icon: Icon(Icons.send)),
                )
              ],
            ),
            Container(
              child: Expanded(
                child: mensajes(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
