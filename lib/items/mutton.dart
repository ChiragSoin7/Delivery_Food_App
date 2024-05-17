import 'package:flutter/material.dart';

class Mutton extends StatefulWidget {
  const Mutton({super.key});

  @override
  State<Mutton> createState() => _MuttonState();
}

class _MuttonState extends State<Mutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is mutton Page",style: TextStyle(fontSize: 50),)),
    );
  }
}
