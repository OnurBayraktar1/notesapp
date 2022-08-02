import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/EditPage.dart';
import 'package:notesapp/pages/html_editor_page.dart';
import 'package:notesapp/services/auth.dart';
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
                        PopupMenuItem<int>(
                          value: 1,
                          child: TextButton(
                              onPressed: (){
                            showDialog(
                                context: context, builder: (BuildContext context){
                              return Center(
                                  child:AlertDialog(
                                content: Text('Are u sure'),
                                actions: [
                                  TextButton(onPressed: (){NoteService().deleteNote(uuid).then((value) =>
                                    Navigator.pop(context));
                                  }, child:Text('YES')),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child:Text('NO'))
                                ],
                              ));
                            });
                          }, child: Text('Delete',style: TextStyle(color:Colors.black),))
                        )
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            var height = MediaQuery.of(context).size.height;
                            var width = MediaQuery.of(context).size.width;
                            return Container(
                              height: height - 400,
                              width: width - 400,
                              child: UpdateNoteTitle(context, uuid),
                            );
                          },
                        );
                      }

                    },
                  )),
 Flexible(child: Icon(Icons.description,size: 40,color: Colors.blueGrey,),),


// const Flexible(child:
// SizedBox(height: 10),),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(10),
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
                child: SizedBox(height: 20),
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
              builder: (context) => HtmlEditorExample(uuid: uuid, title: title)),
        );
      });
}
