
import 'package:flutter/material.dart';

Widget Error_Widget(BuildContext context){
  return Center(
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
Image.asset('/img/error.png'),
        const SizedBox(height: 20),
        const Text('ERROR',style: TextStyle(
          fontWeight: FontWeight.bold
        ),)
      ]
    ),

  );



}