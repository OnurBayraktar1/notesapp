
import 'package:flutter/material.dart';

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
    TextButton(onPressed: ()=>Navigator.pop(context,'OK'),
      child:const Text('OK'),


        ),
        TextButton(onPressed: ()=>Navigator.pop(context,'CANCEL'),
  child:const Text('CANCEL'),),
  ],
  );




}
