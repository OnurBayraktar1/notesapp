import 'package:flutter/material.dart';

import '../widgets/empty_note_widget.dart';
import '../widgets/note_widget.dart';

class EmptyNotePage extends StatefulWidget {
  @override
  _EmptyNotePageState createState() => _EmptyNotePageState();
}

class _EmptyNotePageState extends State<EmptyNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MYNOTES',style: TextStyle(fontWeight: FontWeight.bold),) ,
      ),
      body: EmptyNoteWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,color: Colors.white, size: 40),
        onPressed: () { showDialog(
          context: context,
          builder: (BuildContext context) => NoteWidget(context),
        ); },
      ),
    );
  }
}
