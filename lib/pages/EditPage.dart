import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditPage extends StatefulWidget {
  EditPage

  ( {super.key, this.uuid,this.title});

  final uuid;
  final title;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  var collection = FirebaseFirestore.instance.collection('users');

  var currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _controller = TextEditingController();

  NoteService _noteService = NoteService();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { var updateTime=formatDate(DateTime.now(), [yyyy,'/',mm,'/',dd]).toString();
            _noteService
                .updateNote(_controller.text, widget.uuid.toString(),updateTime)
                .then((value) {
              return Navigator.pop(context);
            });
          },
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: NoteService().getNotes(widget.uuid),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            _controller.text = data['content'] ?? '';


            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _controller,

                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    //border:OutlineInputBorder(),
                    labelText: 'Type Something',

                  ),
                ),
              ],
            );
          }

          return Text("loading");
        },
      ),


    );
  }
}
