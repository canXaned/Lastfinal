import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/category.dart';
import 'package:flutter_application_2/comp/bottomNavigationBar.dart';
import 'package:flutter_application_2/comp/header.dart';
class CategoriesPage extends StatelessWidget {
  List<String> categories = [
    "Her şey",
    "Bilgisayarlar",
    "Aksesuarlar",
    "Telefonlar",
    "Şarj cihazları",
    "Kişisel bakım",
    "Beyaz eşya",
    "Fotoğraf makinesi",
    "Elektrikli ev aletleri",


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
            header("Kategoriler", context),
              
            SizedBox(height: 20),
            //kategoriler
            Expanded(
              child: ListView(
                children: categories
                    .map((String title) => buildCategory(title, context))
                    .toList()),
            ),
          ],
        ),
      ),
    //bottomnavigation
    bottomNavigationBar("search"),
    ])));
  }
}

Widget buildCategory(String title, context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) {
        return CategoryPage();
      }));
    },
    child: Container(
      padding:EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 15),
      width:double.infinity ,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(0,4)),
          ]),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0A1034)),
      ),
    ),
  );
}