import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';

Widget UpdateNoteTitle(BuildContext context,String uuid){

  final TextEditingController _title = TextEditingController();
  return AlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: _title,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
labelText:'Enter new title'
          ),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
          child: const Text('OK'),
          onPressed: () {
            NoteService()
                .updateNoteTitle(_title.text, uuid)
                .then((value) => Navigator.pop(context));
          }),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('CANCEL'),
      ),
    ],
  );
}