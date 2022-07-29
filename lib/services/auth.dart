import 'package:authentication_provider/authentication_provider.dart';
import 'package:authentication_provider/authentication_provider.dart';
import 'package:authentication_provider/authentication_state.dart';
import 'package:authentication_provider/authentication_state.dart'as authState;
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/pages/homepage.dart';

import '../widgets/loading_widget.dart';
class AuthService{
Stream<User?>get authState=>_auth.idTokenChanges();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<User?>signIn(String email,String password)async {
    var user=await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }
signOut()async{
    return await _auth.signOut();
  }
Future<User?>createPerson(String name,String email,String password) async{


  var user = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);

    await _firestore.collection("users")

    .doc(user.user!.uid)
    .set({

      "display name":name,
      "email":email
    });

    return user.user;


}


}