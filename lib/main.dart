import 'package:flutter/material.dart';
import 'package:udemyr/layout/home_layout.dart';
import 'package:udemyr/modules/bmicalculator/bmicalculator.dart';
import 'package:udemyr/modules/bmiresult/bmiresult.dart';
import 'package:udemyr/modules/counterscreen/counterscreen.dart';
import 'package:udemyr/modules/login/login.dart';
import 'package:udemyr/modules/userscreen/usersscreen.dart';

import 'modules/messengerscreen/messenger_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),

    );
  }
}
