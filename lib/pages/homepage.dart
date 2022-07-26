import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';

import 'package:notesapp/widgets/Note_List_widget.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/services/auth.dart';
import 'package:notesapp/widgets/error_widget.dart';
import 'package:notesapp/widgets/loading_widget.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentUser=FirebaseAuth.instance.currentUser;
  late DocumentSnapshot snapshot;
  final AuthService _authService=AuthService();
  void getData() async{
   final data=await FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).get();
   snapshot=data;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        actions: <Widget>[
         // Text(snapshot.data['display name']),
        IconButton(
          icon:const Icon(Icons.logout ),
              onPressed: (){
            _authService.signOut(); Navigator.push( context,
                MaterialPageRoute(builder: (context)=>const LoginPage()));
            }
        ),],
        centerTitle: true,
        title: const Text('MY NOTES',style: TextStyle(fontWeight: FontWeight.bold),) ,
      ),
      body:NoteListWidget(context),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,color: Colors.white, size: 40),
        onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) => AddNote(context),
        ); },
      ),
    );
  }
}
