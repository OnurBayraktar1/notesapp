
import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';


class AddNote extends StatefulWidget {

  AddNote(BuildContext context);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _content = TextEditingController();

  NoteService _noteService=NoteService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _title,
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
          onPressed: () {  _noteService.createNote(_title.text).then((value) => Navigator.pop(context));

          }



        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}