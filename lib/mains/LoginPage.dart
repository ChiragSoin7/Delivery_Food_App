import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:mregg/mains/Create.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  void initState(){
    super.initState();
    Firebase.initializeApp();
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(left: 20, right: 20, top: 130, bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 300),
                child: RichText(text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>HomePage()),
                    text: "skip>",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black
                    )
                )),
              ),
              RichText(text: TextSpan(
                text: "Hello, \nWelcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Colors.black
                ),)),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  controller: _pass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                  ),
                ),
              ),
              SizedBox(
                height: 220,
              ),
              Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text,
                          password: _pass.text).then((value){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }).onError((error, stackTrace){
                        print(error);
                      });
                    },
                    color: Theme.of(context).shadowColor,
                    elevation: 0,
                    padding: EdgeInsets.all(18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don\'t have an account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: "Create",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Create())
                            )
                          ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
