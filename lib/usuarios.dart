import 'package:chat_reto3/proceso/autenticacion.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class usuarios extends StatefulWidget {
  const usuarios({super.key});

  @override
  State<usuarios> createState() => _usuariosState();
}

class _usuariosState extends State<usuarios> {
  Stream<QuerySnapshot> resp_usuarios =
      FirebaseFirestore.instance.collection("Chat").snapshots();

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(      
        stream: resp_usuarios,
        builder: (context, AsyncSnapshot<QuerySnapshot> respuesta) {
          return respuesta.data?.docs.isEmpty == false
              ? ListView.builder(
                  itemCount: respuesta.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.cyan[100],
                        child: ListTile(
                          title: Text(respuesta.data!.docs[index].get("email"),
                              style: GoogleFonts.chewy()),
                       
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(children: [
                  Text("Cargando..."),
                  CircularProgressIndicator(),
                ]));
        });
  }
}
