import 'package:flutter/material.dart';
import 'package:mregg/popular/BCM.dart';
import 'package:mregg/items/Chicken.dart';
import 'package:mregg/items/Kabab.dart';
import 'package:mregg/items/curry.dart';
import 'package:mregg/items/mutton.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: Icon(null),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.grey[800],
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Food Delivery",
                    style: TextStyle(
                        color: Colors.grey[80],
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        makeCategory(isActive: true, title: 'Chicken'),
                        makeCategory(isActive: true, title1: 'Mutton'),
                        makeCategory(isActive: true, title2: 'Curry'),
                        makeCategory(isActive: true, title3: 'Kebab'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Popular",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    makeItem(image: 'assets/sec.jpg',t: "Butter Chicken Masala",ta: "\₹ 150/-"),
                    makeItem(image: 'assets/third.jpg',t1: "Lolipop Chicken",tb: "\₹ 200/-"),
                    makeItem(image: 'assets/forth.jpg',t2: "Chicken Sandwich",tc: "\₹ 120/-"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  makeItem({image,t,ta,t1,tb,tc,t2}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bcm()));
        },
        child: Container(
          margin: EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                text:ta,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              ),
                              RichText(text: TextSpan(
                                text: t,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                  text:tb,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              ),
                              RichText(text: TextSpan(
                                text: t1,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(text: TextSpan(
                                  text:tc,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                              ),
                              RichText(text: TextSpan(
                                text: t2,
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCategory({isActive, title,title1,title2,title3}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.0 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child:Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                RichText(text: TextSpan(
                  text: title,
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Chicken()),
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[500],
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
                ),
                ),
                RichText(text: TextSpan(
                  text: title1,
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Mutton()),
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[500],
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
                ),
                ),
                RichText(text: TextSpan(
                  text: title2,
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Curry()),
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[500],
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
                ),
                ),
                RichText(text: TextSpan(
                  text: title3,
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>Kabab()),
                  style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey[500],
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }


}
