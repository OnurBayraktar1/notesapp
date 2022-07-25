import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/pages/RegisterPage.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';
import 'package:notesapp/widgets/add_note_widget.dart';


import'package:cloud_firestore/cloud_firestore.dart';
import 'package:notesapp/widgets/empty_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MYNOTES',style: TextStyle(fontWeight: FontWeight.bold),) ,
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
