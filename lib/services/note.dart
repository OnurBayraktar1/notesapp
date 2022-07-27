import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/services/auth.dart';
import 'package:uuid/uuid.dart';
class NoteService {



 var  notes= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection(
  'notes');

  Future<NoteService?> createNote(String title) async {
    var uuid = Uuid().v1();

    await notes
        .doc(uuid).set({
      'uid': uuid,
      'title': title,

    });
  }

  Future<NoteService?> updateNote(String content, String uuid) async {
    await notes
        .doc(uuid)
        .update(
        {

          'content': content,

        }).then((value) => null);
    return null;

  }

  Future<NoteService?> deleteNote(String uuid) async {
    await notes.doc(uuid)
        .delete();
    return null;
  }
Future<CollectionReference<Map<String, dynamic>>>getNoteList() async{
    return await notes;
}

}