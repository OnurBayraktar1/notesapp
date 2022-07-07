import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/pages/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  decoration: const InputDecoration( prefixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child:Icon(Icons.person, color:Colors.black)
                  ),
                    border: OutlineInputBorder(),
                  labelText: 'Name'
                  ),

                  validator: (value){
if(value!.isEmpty){return "Please enter your name";}

if(!RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(value)){
  return "Enter valid name";
} else {
  return null;}
    },

                ),
              ),
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                  child:TextFormField(
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
                      if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                        return "Enter correct Email";}
                      else {
                        return null;}
                    },
                  )

              ),
              Container( padding: const EdgeInsets.only(bottom:10,top:10),
                  child:TextFormField(
                    controller: _pass,
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
                    decoration: const InputDecoration(prefixIcon: Padding(
                        padding: EdgeInsets.all(0),
                        child:Icon(Icons.lock_outline, color:Colors.black)
                    ),
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password'
                    ),
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty ){
    return "It can't be empty";
    }
                      if(value!=_pass.text){
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
                        showModalBottomSheet<void>(
                            context:context,
                            builder:(BuildContext context) {
                              return Container(
                                  height:200,
                                  child:Center(
                                      child:Column(
                                        mainAxisAlignment:MainAxisAlignment.center ,
                                        children: <Widget>[
                                          const Text("Register is success"),
                                        ],
                                      )
                                  )
                              );
                            }
                        );
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
