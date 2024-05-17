import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mregg/mains/HomePage.dart';
import 'package:mregg/mains/LoginPage.dart';


class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

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
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Login()),
                    text: "<Back",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black
                    )
                )),
              ),
              RichText(text: TextSpan(
                text: "Hey, \nRegister here",
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
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text,
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
                          "Register",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
