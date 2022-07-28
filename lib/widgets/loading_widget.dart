import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Loading_Widget(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text('Loading...'),
        ),
      ],
    ),
  );
}
