import 'dart:js';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:"AIzaSyBAicRvIBBGoXB7ni3wBGiqLB1QAH_25kE",
        appId: "1:586326868384:web:e8b41073e5da949f6ce4c5",
        messagingSenderId: "586326868384",
        projectId: "noteapp-c59b2")
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY NOTES',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
    );
  }
}
