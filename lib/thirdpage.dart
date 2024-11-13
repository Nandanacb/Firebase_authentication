import 'package:flutter/material.dart';

class Thirdpage extends StatefulWidget {
  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
    );
  }
}
