import 'package:flutter/material.dart';

class Curry extends StatefulWidget {
  const Curry({super.key});

  @override
  State<Curry> createState() => _CurryState();
}

class _CurryState extends State<Curry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is Curry Page",style: TextStyle(fontSize: 50),)),
    );;
  }
}
