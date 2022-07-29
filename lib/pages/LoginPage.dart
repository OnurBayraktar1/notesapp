import 'package:flutter/material.dart';
import 'package:notesapp/pages/RegisterPage.dart';
import 'package:notesapp/pages/homepage.dart';
import 'package:notesapp/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ButtonStyle textButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.grey,
    minimumSize: Size(500, 20),
    padding: EdgeInsets.all(20),
  );
  AuthService _authService = AuthService();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title:
                  Text('LOGIN', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            body: Center(
                child: Flexible(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Icon(Icons.account_circle_sharp,
                                    size: 120),
                                const Text('Sign with e-mail and password.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextFormField
                                    (
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Icon(Icons.email,
                                                color: Colors.black)),
                                        border: OutlineInputBorder(),

                                        labelText: 'E-mail'),
                                    validator: (emailController) {
                                      if (emailController!.isEmpty) {
                                        return "Please enter E-mail";
                                      }
                                      if (!RegExp(
                                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(emailController)) {
                                        return "Enter correct Email";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 20),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Icon(Icons.lock_outline,
                                                color: Colors.black)),
                                        border: OutlineInputBorder(),
                                        labelText: 'Password'),
                                    obscureText: true,
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
                                  padding: const EdgeInsets.all(0),
                                  height: 50,
                                  child: ElevatedButton(
                                      style: textButtonStyle,
                                      child: const Text(
                                        'LOGIN',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          _authService
                                              .signIn(_emailController.text,
                                                  _passwordController.text)
                                              .then((value) {
                                            return Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          });
                                        }
                                      }),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 50,
                                  child: const Text(
                                    "Don't have an account",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  child: const Text(
                                    'SIGN UP',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                )
                              ],
                            )))))));
  }
}
