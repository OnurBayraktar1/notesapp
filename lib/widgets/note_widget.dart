
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/EditPage.dart';

Widget NoteWidget(BuildContext context,QueryDocumentSnapshot doc){

  return Padding(
      padding:const EdgeInsets.all(20),
    child:Container(

    color: Colors.grey,
    width: 600,
    height: 100,

    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
       Text(
         doc['title'], style: TextStyle(
          color:Colors.black,fontWeight: FontWeight.bold
        ),),

Align(alignment: Alignment.topRight,
  child:IconButton(

  icon: const Icon(Icons.edit),
  onPressed:() => Navigator.push(context,
    MaterialPageRoute(builder: (context)=> const EditPage()),),




))

      ],
    ),
    )
  );




}