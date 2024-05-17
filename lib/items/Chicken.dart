import 'package:flutter/material.dart';
import 'package:mregg/widgets/Featured_Chik.dart';
import '../mains/HomePage.dart';
import '../helpers/colors.dart';

class Chicken extends StatelessWidget {
  const Chicken({super.key});

  Widget _buildFeaturedProduct(String name, double price, String image){
    return Card(
      child:
    Container(
      height: 250,
      width: 170,
      // color: Colors.blue,
      child: Column(
        children: [
          Container(
            height: 190,
            width: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$image')
                )
            ),
          ),
          Text("₹ $price",style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xff99b96d6)),
          ),
          SizedBox(height: 4,),
          Text(name,style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 16,),
          ),
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chicken",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            }),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_basket,color: Colors.black,))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        offset: Offset(1,1),
                        blurRadius: 4
                    )
                  ]
              ),
              child: ListTile(
                leading: Icon(Icons.search,color: Colors.red,),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: "Find food here",
                      border: InputBorder.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/chik.jpg')
              //   )
              // ),

              child:Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    Text("See all",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Featured(),
            SizedBox(height: 20,),
            Featured(),
            SizedBox(height: 20,),
            Featured(),
            SizedBox(height: 20,),
            Featured(),
            // SizedBox(height: 20,),
            // Featured(),
            // SizedBox(height: 20,),
            // Featured(),
            // SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

// void _runFilter(String enteredKeyword) {
//   List<> results = [];
//   if (enteredKeyword.isEmpty) {
//     results = todosList;
//   } else {
//     results = todosList
//         .where((item) => item.todoText!
//         .toLowerCase()
//         .contains(enteredKeyword.toLowerCase()))
//         .toList();
//   }
//
//   setState(() {
//     _foundToDo = results;
//   });
// }

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      // onChanged: (value) => _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}
