import 'package:flutter/material.dart';
import 'package:mregg/helpers/ChikItems.dart';
import 'package:mregg/helpers/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.items});
  final ChikItems items;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton( icon:Icon(Icons.arrow_back_ios),onPressed: (){Navigator.pop(context);}),
                IconButton(icon:Icon(Icons.shopping_basket),onPressed: (){}),
              ],
            ),
            CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image:AssetImage('assets/${widget.items.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/${widget.items.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/${widget.items.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 380.0,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            Positioned(
                right: 1,
                bottom: 2,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined),))
          ],
        ),
      ),
    );
  }
}
