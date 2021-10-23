import 'package:flutter/material.dart';

Widget defaultButton({
 double width =double.infinity,
  Color backgroud =Colors.black,
  required Function function ,
  required String text,
}) =>Container(
  width: width,
  decoration: BoxDecoration(
    color: backgroud,
    borderRadius: BorderRadius.circular(20.0),
  ),
  child: MaterialButton(
    onPressed: (){
      function();
    },
    child: Text(
      text.toUpperCase(),
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 17.0),
    ),
  ),
);