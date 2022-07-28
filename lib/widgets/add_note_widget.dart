import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';

Widget AddNote(BuildContext context) {
  final TextEditingController title = TextEditingController();

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
                  .createNote(title.text)
                  .then((value) => Navigator.pop(context));
            }),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }

