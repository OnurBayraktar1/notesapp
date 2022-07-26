

import 'package:flutter/material.dart';
import 'package:notesapp/services/note.dart';
import 'package:notesapp/widgets/Note_List_widget.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _content=TextEditingController();
  final TextEditingController _title=TextEditingController();
  NoteService _noteService=NoteService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
leading: IconButton(
  icon:Icon(Icons.arrow_back),
  onPressed: (){ _noteService.updateNote(_content.text).then((value){
    return Navigator.pop(context);
  }
  );


  },
),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          const Text('title',style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          TextFormField(
            controller: _content,
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding:EdgeInsets.all(20),),
                //border:OutlineInputBorder(),
                labelText: 'Type Something'
              )
            ),
  ]
          )

      );




  }
}
