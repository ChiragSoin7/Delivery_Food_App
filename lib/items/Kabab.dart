import 'package:flutter/material.dart';

class Kabab extends StatefulWidget {
  const Kabab({super.key});

  @override
  State<Kabab> createState() => _KababState();
}

class _KababState extends State<Kabab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is Kabab Page",style: TextStyle(fontSize: 50),)),
    );;
  }
}
