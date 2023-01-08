import 'package:flutter/material.dart';
import 'package:flutter_application_2/comp/header.dart';
import 'package:flutter/src/widgets/container.dart';

class ProductDetailPage extends StatefulWidget {

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  
  List<Color> colors=[
    Colors.pink,
    Colors.red,
    Colors.brown,
    Colors.yellow,

  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child:Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             //header
             header("MacBook Air", context),
             SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                 //resim
                  Image.asset("assets/images/mac.jpg"),
                  SizedBox(height:25),
                 //renk
                 Text("Renkler",
                 style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0A1034)),),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: colors
            .map((Color color) => colorOption(color))
            .toList()),
             




              ]),)


          ]))
    ])));
  }
}

Widget colorOption(Color color){
return Container(
     margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
              ),
              width:23,
              height: 23,
              
              );
  
}