import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_widget.dart';


Widget NoteListWidget(BuildContext context){
  return Container(
    child:Center(
      child: Column(
        children: <Widget>[
          Text('This is note list'),
          AddNoteWidget(context)
        ],
      ),
    ),
  );


}