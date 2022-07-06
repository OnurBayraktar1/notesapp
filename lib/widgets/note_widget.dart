
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
  );




}
