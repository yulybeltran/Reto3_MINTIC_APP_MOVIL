import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../proceso/autenticacion.dart';

class mensajes extends StatefulWidget {
  const mensajes({super.key});

  @override
  State<mensajes> createState() => _mensajesState();
}

class _mensajesState extends State<mensajes> {
  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
      .collection("Chat")
      .orderBy("tiempo", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: resp_consulta,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: (Autenticacion().usuarios?.email).toString() ==
                          respuesta.data!.docs[index].get("email")
                      ? Colors.purple[100]
                      : Colors.cyan[100],
                  child: ListTile(
                    title: Text(
                      respuesta.data!.docs[index].get("mensaje"),
                      textAlign: (Autenticacion().usuarios?.email).toString() ==
                              respuesta.data!.docs[index].get("email")
                          ? TextAlign.left
                          : TextAlign.right, style: GoogleFonts.chewy()
                    ),
                    subtitle: Text(respuesta.data!.docs[index].get("email"),
                        textAlign: (Autenticacion().usuarios?.email).toString() ==
                                respuesta.data!.docs[index].get("email")
                            ? TextAlign.left
                            : TextAlign.right, style: GoogleFonts.chewy()),
                  ),
                ),
              );
            },
          );
        });
  }
}
