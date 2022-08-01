import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/services/auth.dart';
import 'package:notesapp/widgets/empty_note_widget.dart';
import 'package:notesapp/widgets/error_widget.dart';
import 'package:notesapp/widgets/loading_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String title = '';
  var currentUser = FirebaseAuth.instance.currentUser;
  final AuthService _authService = AuthService();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold( resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'MY NOTES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _authService.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.note_add, color: Colors.white, size: 40),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AddNote(context),
          );
        },
      ),
      body:Center(child: Flexible(

        child:
            StreamBuilder<QuerySnapshot>(
            stream: usersCollection.doc(currentUser?.uid).collection('notes').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Error_Widget(context);
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading_Widget(context);
              }
              if (snapshot.data!.docs.isEmpty) {
                return EmptyNoteWidget(context);
              }

             return NoteListWidget(context,snapshot);


            }),

    )));
  }
}
