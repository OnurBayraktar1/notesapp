import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';


Widget NoteListWidget(BuildContext context){
  return Container(
    child:Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          NoteWidget(context),
          NoteWidget(context),
          NoteWidget(context)
        ],
      ),
    ),
  );


}