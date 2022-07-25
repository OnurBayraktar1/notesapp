
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';


class AddNote extends StatelessWidget {
  final TextEditingController _title = TextEditingController();

  AddNote(BuildContext context);


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
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => NoteListWidget(context),
            );
          },
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}