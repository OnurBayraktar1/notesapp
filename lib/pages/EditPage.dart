import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _content = TextEditingController();
late String nid;
  NoteService _noteService = NoteService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _noteService
                  .updateNote(_content.text, nid.toString())
                  .then((value) {
                return Navigator.pop(context);
              });
            },
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                  controller: _content,
                  decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      //border:OutlineInputBorder(),
                      labelText: 'Type Something')),
            ]));
  }
}
