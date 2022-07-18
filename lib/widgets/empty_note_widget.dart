import 'package:flutter/material.dart';

Widget EmptyNoteWidget(BuildContext context){
  return Container(
    child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Image.asset("/img/note.png",width:150 ),
            SizedBox(height: 20),
            const Text('No notes! Click button to add notes.',style: TextStyle(fontSize: 20)),
          ]
      ),
    ),
  );
}