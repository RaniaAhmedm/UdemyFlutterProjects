import 'package:flutter/material.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Archived',style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
