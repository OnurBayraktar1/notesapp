import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';






Widget NoteListWidget(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){

  return GridView(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data =
    document.data()! as Map<String, dynamic>;
    var title =data['title'];
    var uuid=data['uid'];
    return NoteWidget(context, title,uuid);
      }).toList(), );
}