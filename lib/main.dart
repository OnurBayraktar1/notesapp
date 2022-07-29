
import 'package:authentication_provider/authentication_state.dart' as AuthState;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:authentication_provider/authentication_provider.dart';
import 'package:notesapp/widgets/loading_widget.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:  const FirebaseOptions(
        apiKey:"AIzaSyBAicRvIBBGoXB7ni3wBGiqLB1QAH_25kE",
        appId: "1:586326868384:web:e8b41073e5da949f6ce4c5",
        messagingSenderId: "586326868384",
        projectId: "noteapp-c59b2")
  );

  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthenticationController controller;


  @override
  void initState() {
    super.initState();
    controller = AuthenticationController<User>(context);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'MY NOTES',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home:Authanticate()

    );
  }

}

class Authanticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null){
      return HomePage();
    }
    return LoginPage();

  }
}



