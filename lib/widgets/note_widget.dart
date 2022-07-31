import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/EditPage.dart';
import 'package:notesapp/services/note.dart';
import 'package:notesapp/widgets/update_title_widget.dart';

Widget NoteWidget(BuildContext context, String title, String uuid,String updateTime) {
  return InkWell(
      child: Card(
        margin: const EdgeInsets.all(10),
        borderOnForeground: true,
        color: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text('Edit'),
                        ), const PopupMenuItem<int>(
                          value: 1,
                          child: Text('Delete'),
                        )
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return UpdateNoteTitle(context, uuid);
                            },);
                            }
                            if (value == 1)
                        {
                          NoteService().deleteNote(uuid);
                        }
                      },
                  )
              ),
              const SizedBox(height: 10),
              Image.asset("/img/icon_note.png", height: 40),
              const SizedBox(height: 10),
              Text(title),
              SizedBox(height: 20,),Align(   alignment: Alignment.bottomRight,
          child: Text('Update Time:$updateTime',overflow: TextOverflow.ellipsis ,style: TextStyle(
              decorationThickness: 2
          ),),)
            ],
           ),

      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditPage(uuid: uuid, title: title)),
        );
      });
}
