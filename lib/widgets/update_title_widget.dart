import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';

Widget UpdateNoteTitle(BuildContext context, String uuid) {
  final TextEditingController title = TextEditingController();
  return AlertDialog(
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: title,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(), labelText: 'Enter new title'),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            NoteService()
                .updateNoteTitle(title.text, uuid)
                .then((value) => Navigator.pop(context));
          },
          child: const Text('OK')),
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('CANCEL'),
      ),
    ],
  );
}
