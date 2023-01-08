import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/comp/bottomNavigationBar.dart';
import 'package:flutter_application_2/comp/header.dart';
import 'package:flutter_application_2/productsDetail.dart';

class CategoryPage extends StatelessWidget {
  List<Map> products = [
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"999 USD"},
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"900 USD"},
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"875 USD"},
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"850 USD"},
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"800 USD"},
    {"isim": "Mac Air","fotoğraf":"assets/images/mac1.jpg","fiyat":"775 USD"},
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
             header("Laptop", context),
             SizedBox(height: 32),
             

             //içerikler
             

            Expanded(
              child: GridView.count(
               crossAxisCount: 2, 
               mainAxisSpacing: 12,
               crossAxisSpacing: 10,
               children: products.map((Map product) {
                return  buildContent(
                  product["isim"], product["fotoğraf"], product["fiyat"],context);
               }).toList(),
              ),
            )
            ],         
          ),
      ),

      //bottom navigation 
      bottomNavigationBar("search"),
    ])));
  }
}

Widget buildContent(String title, String photoUrl, String price, context){
  return  GestureDetector(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder:(context) {
        return ProductDetailPage();
        }));
      

    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 11, ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),boxShadow:[
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0,16))
        ],
      ),
      child: Column(children: [
        SizedBox(height: 15),
        Image.asset(photoUrl),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, 
              style: TextStyle(
                color: Color(0xFF0A1034), 
                fontSize: 15, 
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Fiyat: $price",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 20, 131), 
                fontSize: 11, 
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16,)
          ],
        ),
      ],
      ),
    ),
  );
}