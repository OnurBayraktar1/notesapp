import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:notesapp/services/note.dart';




class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title,required this.uuid}) : super(key: key);

  final uuid;
  final title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {

  var collection = FirebaseFirestore.instance.collection('users');
  late HtmlEditorController controller = HtmlEditorController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),

        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () { var updateTime=formatDate(DateTime.now(), [yyyy,'/',mm,'/',dd]).toString();
          NoteService()
              .updateNote(controller.getText().toString(), widget.uuid.toString(),updateTime)
              .then((value) {
            return Navigator.pop(context);
          });
          },
        ),
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: NoteService().getNotes(widget.uuid),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (snapshot.hasError) {
    return const Text("Something went wrong");
    }

    if (snapshot.hasData && !snapshot.data!.exists) {
    return const Text("Document does not exist");
    }

    if (snapshot.connectionState == ConnectionState.done) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    //controller = data['content'] ?? '';
    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    const SizedBox(height: 15,),
    Container(
    padding: const EdgeInsets.all(20),
    child:Center(
    child:
    HtmlEditor(
    controller: controller, //required
    htmlEditorOptions: HtmlEditorOptions(
    hint: "Your text here...",

    ),
    otherOptions: const OtherOptions(
    height: 400,
    ),
    ),),),
    ],
    );
    }

    return const Text("loading");
    },
    ),
    );
  }
}