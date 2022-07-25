

import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController _content=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body:Container(
      child:Column(
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





)

      );




  }
}
