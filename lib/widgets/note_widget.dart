import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/EditPage.dart';
import 'package:notesapp/services/note.dart';
import 'package:notesapp/widgets/update_title_widget.dart';

Widget NoteWidget(
    BuildContext context, String title, String uuid, String updateTime) {
  return InkWell(
      child: Card(
          shadowColor: Colors.blueGrey,
          margin: const EdgeInsets.all(10),
          borderOnForeground: true,
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text('Edit'),
                        ),
                        const PopupMenuItem<int>(
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
                          },
                        );
                      }
                      if (value == 1) {
                        NoteService().deleteNote(uuid);
                      }
                    },
                  )),
Flexible(child: Icon(Icons.description,size: 60,color: Colors.blueGrey,),),





// const Flexible(child:
// SizedBox(height: 10),),
              Spacer(),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child:Center(
                  child:Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),),),
              const Flexible(
                child: SizedBox(height: 10),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Flexible(
                    child: Text(
                      updateTime,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(decorationThickness: 2),
                    ),
                  )),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditPage(uuid: uuid, title: title)),
        );
      });
}
