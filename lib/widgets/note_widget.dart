
import 'package:flutter/material.dart';
import 'package:notesapp/pages/EditPage.dart';

Widget NoteWidget(BuildContext context){

  return Padding(
      padding:EdgeInsets.all(20),
    child:Container(

    color: Colors.grey,
    width: 600,
    height: 100,

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Title', style: TextStyle(
          color:Colors.black,fontWeight: FontWeight.bold
        ),),
        Divider(height: 10),

        Text('Content', style:TextStyle(
          color:Colors.black
        )),
Align(alignment: Alignment.topRight,
  child:IconButton(

  icon: Icon(Icons.edit),
  onPressed:() => Navigator.push(context,
    MaterialPageRoute(builder: (context)=> EditPage()),),




))

      ],
    ),
    )
  );




}