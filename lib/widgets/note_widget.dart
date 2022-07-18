
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';
import 'package:notesapp/widgets/empty_note_widget.dart';

Widget NoteWidget(BuildContext context){

return new AlertDialog(
    content:new Column(
      mainAxisAlignment: MainAxisAlignment.center,

        children:<Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border:UnderlineInputBorder(),
              labelText:'TITLE',


            ),
          ),



        ],

    ),
  actions: <Widget>[
    TextButton( child:const Text('OK'),
      onPressed: () { showDialog(context: context,
        builder: (BuildContext context) => NoteListWidget(context),);
  },

),


        TextButton(onPressed: ()=>Navigator.pop(context,'CANCEL'),
  child:const Text('CANCEL'),),
  ],
  );




}
