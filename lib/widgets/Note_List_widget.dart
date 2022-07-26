import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';


Widget NoteListWidget(BuildContext context){
  return Center(
    child: Column(

      children: <Widget>[
        NoteWidget(context),
        NoteWidget(context),
        NoteWidget(context)
      ],
    ),
  );


}