import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:custom_text/custom_text.dart';
import 'package:mregg/helpers/ChikItems.dart';
import 'package:mregg/helpers/Screen_Changers.dart';
import 'package:mregg/mains/Details.dart';

List<ChikItems> itemsList =[
  ChikItems(name: "Crispy Chicken", image: "Crispy4.jpg", price: 150, wishList: true, rating: 4.7),
  ChikItems(name: "Chick Sandwich", image: "forth.jpg", price: 80, wishList: true, rating: 4.9),
];

class Featured extends StatefulWidget {
  const Featured({super.key});

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (_,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    changeScreen(context, Details(items : itemsList[index]));
                  },
                  child: Container(
                    height: 180,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1,1),
                              blurRadius: 4
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        Image.asset("assets/${itemsList[index].image}",height: 140,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(padding: EdgeInsets.all(8.0),
                            child:Text(itemsList[index].name),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: Offset(1,1),
                                          blurRadius: 4
                                      )
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Icon(Icons.favorite_border,color: Colors.red,size: 18,),
                                ),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: CustomText(itemsList[index].rating.toString(),style: TextStyle(color: Colors.grey,fontSize: 14), definitions: [],),
                                ),
                                RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 10,
                                    itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    onRatingUpdate: (index) {}
                                ),
                              ],
                            ),
                            Text("\₹${itemsList[index].price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
