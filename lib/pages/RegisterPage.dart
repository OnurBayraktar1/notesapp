
import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _passwordAgainController=TextEditingController();
  final ButtonStyle textButtonStyle=ElevatedButton.styleFrom(
    primary:Colors.grey,
    minimumSize: Size(500,30),
    padding: EdgeInsets.all(20),

  );
  final AuthService _authService=AuthService();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Center(
                  child: Icon(Icons.account_circle_sharp,size: 120,color: Colors.blueGrey,),
                ),

                  Center(

                    child: const Text(
                      "Complete your details",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child:  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person,color:Colors.blueGrey),
                      ),
                      validator: (value){
                        //if(!isValidName()){return "Enter valid name"}
                        if(value!.isEmpty){return "Please enter your name";}

                        if(!RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value)){
                          return "Enter valid name";
                        } else {
                          return null;}
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color:Colors.blueGrey),
                      ),
                      validator: (value){
                        if(value!.isEmpty ){
                          return "Please enter E-mail";
                        }
                        if(!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return "Enter correct Email";}

                        else {
                          return null;}
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
                          prefixIcon: Icon(Icons.lock,color: Colors.blueGrey,)),
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
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordAgainController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock,color: Colors.blueGrey,)),

                      validator: (passwordAgainController){
                        if(passwordAgainController!.isEmpty ){
                          return "It can't be empty";
                        }
                        if(passwordAgainController!=_passwordController.text){
                          return "not match";
                        }




                        else { return null;}
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        child:  Text('Create an account'),
                        onPressed: () {
                          { if(formKey.currentState!.validate()){

                            _authService.createPerson(_nameController.text, _emailController.text, _passwordController.text).then((value) {

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text('Register suceed'),
                                action: SnackBarAction(
                                  label:'OK',
                                  onPressed: (){},
                                ),
                              ),);

                              return Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));});
                          }
                          }
                        }

                    ),
                  ),
                  Center(
                      child:TextButton(
                        onPressed: (){ Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) =>const LoginPage()),
                        );}, child: const Text('Back to login',style:TextStyle(fontWeight: FontWeight.bold)),
                      )
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
