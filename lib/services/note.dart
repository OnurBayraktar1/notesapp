import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/services/auth.dart';
class NoteService{

  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

var currentUser=FirebaseAuth.instance.currentUser;





  Future<NoteService?>createNote(String title) async{

    await _firestore.collection('users').doc(currentUser?.uid).collection('notes')
        .add(
        {

          'title':title,
          'content':''
        }).then((value) => null);

  }
  Future<NoteService?>updateNote(String content) async{

    var collection=FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).collection('notes')
    .doc()
        .update(
        {
          'content':content,
          'title':''

        }).then((value) => null);

  }
}





