import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/pages/RegisterPage.dart';
import 'package:notesapp/widgets/add_note_widget.dart';


import'package:cloud_firestore/cloud_firestore.dart';

class EmptyNotePage extends StatefulWidget {
  @override
  _EmptyNotePageState createState() => _EmptyNotePageState();
}

class _EmptyNotePageState extends State<EmptyNotePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MYNOTES',style: TextStyle(fontWeight: FontWeight.bold),) ,
      ),
      //body://EmptyNoteWidget(context),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,color: Colors.white, size: 40),
        onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) => AddNoteWidget(context),
        ); },
      ),
    );
  }
}
