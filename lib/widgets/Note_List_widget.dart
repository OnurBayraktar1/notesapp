import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/add_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';






Widget NoteListWidget(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
var count=3;
if(MediaQuery.of(context).size.width<700){
  count=2;
}
  return GridView(
    padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
      ),
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data =
    document.data()! as Map<String, dynamic>;
    var title =data['title'];
    var uuid=data['uid'];
    var updateTime=data['update time'];
    return Container(
        child:NoteWidget(context, title,uuid,updateTime)
    );
      }).toList(), );
}