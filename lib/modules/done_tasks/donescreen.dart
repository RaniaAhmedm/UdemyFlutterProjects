import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text('Done',style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
