import 'package:flutter/material.dart';
import 'package:notesapp/pages/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('LOGIN' ,style:TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Container(
            padding:EdgeInsets.all(20),
            child: Form(
            key: formKey,
                child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.account_circle_sharp, size: 120),
                Container(

                  child: TextFormField(
                    decoration: const InputDecoration( prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child:Icon(Icons.email, color:Colors.black)
                    ),
                        border: OutlineInputBorder( ),
                       labelText: 'E-mail'),
                    validator: (value){
                      if(value!.isEmpty ){
                        return "Please enter E-mail";
                      }
                      if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                        return "Enter correct Email";}
                      else {
                        return null;}
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom:20,top:20),

                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Padding(
                            padding: EdgeInsets.all(0),
                            child:Icon(Icons.lock_outline, color:Colors.black)
                        ),
                        border: OutlineInputBorder(), labelText: 'Password'),
                    obscureText: true,
validator: (value){
  if(value!.isEmpty ){
    return "Please enter password";
  }
                      if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$').hasMatch(value)){
                        return "Password should contain Capital, small letter & Number and at least 8 digit";}


                      else { return null;}
                      },

                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  child: ElevatedButton(
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.black, backgroundColor: Colors.grey),
                      ),
                      onPressed: () { if(formKey.currentState!.validate()){}
                      }),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                      child: const Text(
                        "Don't have an account",
                        style: TextStyle(
                            color: Colors.black),
                      ),
                ),
                TextButton(
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.grey),
                    ),
                    onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const RegisterPage()),

                    ); },
                )
              ],
            ))));
  }
}
