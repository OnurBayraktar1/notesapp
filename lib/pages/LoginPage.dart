import 'package:flutter/material.dart';
import 'package:notesapp/pages/RegisterPage.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:notesapp/services/auth.dart';
import 'package:notesapp/widgets/empty_note_widget.dart';
import 'package:notesapp/widgets/note_widget.dart';

import 'EditPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 400,
            child:Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child:Icon(Icons.account_circle_sharp,size: 120,)
                  ),
SizedBox(height: 10,),
                  Container(

                    margin: EdgeInsets.all(10),
                   child:Center(
                     child: const Text(
                       "Sign with e-mail and password",
                       style: TextStyle(
                         fontSize: 18,
                       ),
                     ),
                   )
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color:Colors.black),
                      ),validator: (emailController) {
                      if (emailController!.isEmpty) {
                        return "Please enter E-mail";
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(emailController)) {
                        return "Enter correct Email";
                      } else {
                        return null;
                      }
                    },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',

                          prefixIcon: Icon(Icons.lock,color: Colors.black,)),
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return "Please enter password";
                        }
                        if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                            .hasMatch(passwordController)) {
                          return "Password should contain Capital, small letter & Number and at least 8 digit";
                        } else {
                          return null;
                        }
                      },

                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        child: const Text('LOGIN'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _authService
                                .signIn(_emailController.text,
                                _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            });
                          }
                        }
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(

                      children: [
                        Text("Do not have an account yet?"),
                        SizedBox(height: 20,),
                        TextButton(

                          child: const Text('SIGN UP'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}