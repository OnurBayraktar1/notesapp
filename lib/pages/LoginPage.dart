import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/RegisterPage.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:notesapp/services/auth.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'EditPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<bool> _onWillPop() async {
    return false; }
    final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return      WillPopScope(
        onWillPop: _onWillPop,
     child: Scaffold(
        body: Center(
          child: Container(
            width: 400,
            child:Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child:Icon(Icons.account_circle_sharp,size: 120,color: Colors.blueGrey,)
                  ),
const SizedBox(height: 10,),
                  Container(

                    margin: const EdgeInsets.all(10),
                   child:const Center(
                     child: Text(
                       "Sign with e-mail and password",
                       style: TextStyle(
                         fontSize: 18,
                       ),
                     ),
                   )
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color:Colors.blueGrey),
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
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',

                          prefixIcon: Icon(Icons.lock,color: Colors.blueGrey,)),
                      validator: (passwordController) {
                        if (passwordController!.isEmpty) {
                          return "Please enter password";
                        }
                         else {
                          return null;
                        }
                      },

                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        child: const Text('LOGIN'),
                        onPressed: ()
                        {    if(formKey.currentState!.validate()){
                          AuthService()
                                .signIn(_emailController.text,
                                _passwordController.text)
                                .then((value) {
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            }).catchError((dynamic error){
                              if (error.code.contains('invalid-email')) {
                                _buildErrorMessage(context,"Invalid mail address");
                              }
                              if (error.code.contains('user-not-found')) {
                                _buildErrorMessage(context,"E-mail or password is wrong.Please check them");
                              }
                              if (error.code.contains('wrong-password')) {
                                _buildErrorMessage(context,"E-mail or password is wrong.Please check them");
                              }
                              print(error.message);

                            });

                        } }
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    child: Column(

                      children: [
                        const Text("Do not have an account yet?"),
                        const SizedBox(height: 20,),
                        TextButton(

                          child: const Text('SIGN UP'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

void _buildErrorMessage(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
        content: Text(text),
       backgroundColor: Colors.red,
    ),
  );
}

