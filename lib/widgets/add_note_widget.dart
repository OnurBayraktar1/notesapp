import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';
import 'package:date_format/date_format.dart';
Widget AddNote(BuildContext context) {
  final TextEditingController title = TextEditingController();
  final time=formatDate(DateTime.now(), [yyyy,'/',mm,'/',dd]).toString();

    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: title,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'TITLE',
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            child: const Text('OK'),
            onPressed: () {
              NoteService()
                  .createNote(title.text,time)
                  .then((value) => Navigator.pop(context));
            }),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }

