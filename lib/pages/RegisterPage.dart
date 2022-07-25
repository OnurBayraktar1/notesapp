
import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';
import 'package:notesapp/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _passwordAgainController=TextEditingController();

  AuthService _authService=AuthService();
  final formKey = GlobalKey<FormState>();
final TextEditingController _pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text('REGISTER',style:TextStyle(fontWeight: FontWeight.bold))
      ),
      body:Container( padding: EdgeInsets.all(10),

        child: Form(  key: formKey,
          child:Column(
            children: <Widget>[
              const Icon(Icons.account_circle_sharp, size: 120),
              const Text('Complete your details',style:TextStyle(color:Colors.black)),
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                child:TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration( prefixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child:Icon(Icons.person, color:Colors.black)
                  ),
                    border: OutlineInputBorder(),
                  labelText: 'Name'
                  ),

                  validator: (value){
                    //if(!isValidName()){return "Enter valid name"}
if(value!.isEmpty){return "Please enter your name";}

if(!RegExp(r"^\s*([A-Za-z]{onur,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value)){
  return "Enter valid name";
} else {
  return null;}
    },

                ),
              ),
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                  child:TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child:Icon(Icons.email, color:Colors.black)
                    ),
                        border: OutlineInputBorder(),
                        labelText: 'E-mail'
                    ),
                    validator: (value){
                      if(value!.isEmpty ){
                        return "Please enter E-mail";
                      }
                      if(!RegExp(r'^[\w-@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                        return "Enter correct Email";}
                      else {
                        return null;}
                    },
                  )

              ),
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                  child:TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration( prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child:Icon(Icons.lock_outline, color:Colors.black)
                    ),
                        border: OutlineInputBorder(),
                        labelText: 'Password'
                    ),
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
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                  child:TextFormField(
                    controller: _passwordAgainController,
                    decoration: const InputDecoration(prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child:Icon(Icons.lock_outline, color:Colors.black)
                    ),
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password'
                    ),
                    obscureText: true,
                    validator: (_passwordAgainController){
                      if(_passwordAgainController!.isEmpty ){
    return "It can't be empty";
    }
                      if(_passwordAgainController!=_passwordController.text){
                        return "not match";
                      }




                      else { return null;}
                    },

                  )
              ),
              Container(padding: const EdgeInsets.all(10),
                  child:ElevatedButton(
                    onPressed: (){
                      { if(formKey.currentState!.validate()){
                        _authService.createPerson(_nameController.text, _emailController.text, _passwordController.text).then((value) {
                      return Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));});

                      }
                      }

                      }
                    , child: Text('Create an account',style:TextStyle(fontWeight: FontWeight.bold)),
                  )
              ),


              Container(padding: const EdgeInsets.all(10),
                child:TextButton(
                  onPressed: (){ Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) =>const LoginPage()),
                  );}, child: Text('Back to login',style:TextStyle(fontWeight: FontWeight.bold)),
                )
              )
            ],
          )
        )
      )
    );
  }
}
