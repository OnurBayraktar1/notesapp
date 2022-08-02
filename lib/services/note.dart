import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/services/auth.dart';
import 'package:uuid/uuid.dart';
class NoteService {



 var  notes= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection(
  'notes');

  Future<NoteService?> createNote(String title,String updateTime) async {
    var uuid = Uuid().v1();

    await notes
        .doc(uuid).set({
      'uid': uuid,
      'title': title,
'update time':updateTime
    });
  }

  Future<void> updateNote(String content, String uuid,String updateTime) async {
    await notes
        .doc(uuid)
        .update(
        {

          'content': content,
          'update time':updateTime
        }).then((value) => null);

  }

  Future<NoteService?> deleteNote(String uuid) async {
    await notes.doc(uuid)
        .delete();
    return null;
  }
 Future<NoteService?> updateNoteTitle(String title, String uuid) async {
   await notes
       .doc(uuid)
       .update(
       {

         'title': title,

       }).then((value) => null);
   return null;

 }
 Future<DocumentSnapshot>getNotes(String uuid) async{

   return notes.doc(uuid).get();
    // return null;
 }
}