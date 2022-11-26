
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'interfaz/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
         apiKey: "AIzaSyCvjq3SmoUBaUdwyoBaRUf5uKPQsvKNG_Y",
  authDomain: "chat-reto3-1e777.firebaseapp.com",
  projectId: "chat-reto3-1e777",
  storageBucket: "chat-reto3-1e777.appspot.com",
  messagingSenderId: "660458401940",
  appId: "1:660458401940:web:be3eb06ad4dc8000c0c481",
  measurementId: "G-HKWW44B6BN"));
  runApp(const MyApp());
}
