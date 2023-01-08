import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/categories.dart';
import 'package:flutter_application_2/comp/bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    double screenwidth = MediaQuery.of(context).size.width;


    return   Scaffold(
        body: SafeArea(
          child:Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(             
                  children: [
                    //baslik
                    Padding(
                       padding: const EdgeInsets.only(top: 24.0),
                       child: Text(
                        "Hoşgeldin",
                        style: TextStyle(
                          fontSize: 32,
                          color: Color(0xFF0A1034),
                          fontWeight: FontWeight.bold,                 
                        ),
                       )
                    ),

                    //Banner
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
                        decoration: BoxDecoration(
                          color: Color(0xFF0001FC), 
                          borderRadius: BorderRadiusDirectional.circular(10)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MacBook Air", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                                ),
                        SizedBox(height: 5),
                            Text(
                              "USD 750", 
                              style: TextStyle(
                                color: Colors.white, 
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        Image.asset("assets/images/mac.jpg")
                      ],
                  ),),),

                    //butonlar
                    Padding(
                      padding: EdgeInsets.only(top: 48), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      //ilk
                          buildNavigation(text: "kategori", icon: Icons.menu,widget: CategoriesPage(), context: context),
                          buildNavigation(text: "favori", icon: Icons.star,widget: widget, context: context),
                          buildNavigation(text: "hediye", icon: Icons.card_giftcard,widget: widget, context: context),
                          buildNavigation(text: "en iyiler", icon: Icons.people,widget: widget, context: context),

                          

                        ],
                      ),
                    ),

                    SizedBox(height: 50),
                    //sales
                    Text(
                      "En çok satanlar",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 25,
                         color: Colors.red),
                    ),
                    SizedBox(height: 20),
                    
                    //salesitems
                    Row(
                      children: [
                        buildSalesItem(
                          text: "mouse", 
                          photoUrl: "assets/images/mouse.jpg",
                          discount: "-%50",
                          screenwidth: screenwidth,
                        ),
                        buildSalesItem(
                          text: "klavye", 
                          photoUrl: "assets/images/klavye.jpg",
                          discount: "-%30",screenwidth: screenwidth)
                      ],                 
                    ),

                    Row(
                      children: [
                        buildSalesItem(
                          text: "Monitör", 
                          photoUrl: "assets/images/Monitör.jpg",
                          discount: "-%20",
                          screenwidth: screenwidth,
                        ),
                        buildSalesItem(
                          text: "Monitör", 
                          photoUrl: "assets/images/Monitör.jpg",
                          discount: "-%15",screenwidth: screenwidth)
                      ],                 
                    ),


                  ],
                ),
              ),
              
              //Bottom Navigation Bar
              bottomNavigationBar("home"),
            ],
          ),
        ),
      );
  }
}




Widget buildNavigation({
  required String text, 
  required IconData icon, 
  required Widget widget,
  required BuildContext context,
}) {  
  return  GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) {
        return widget;
      }));
    },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                           horizontal: 19,vertical: 22),                       
                        decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.green),
                        child: Icon(
                           icon, 
                           color: Colors.red,
                           size: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        text,
                        style: TextStyle(
                         color: Color(0XFF1F53E4),
                         fontSize: 14,
                         fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
    );
}

Widget buildSalesItem({
  required String text,
  required String photoUrl,
  required String discount,
  required double screenwidth,
}) {
  return Container(
                  width: (screenwidth-60)*0.5,
                  padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 20),
                  child: Column(
                    children: [
                    //indirim
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.orange),
                      child: Text(
                          discount, 
                          style:
                              TextStyle(color: Colors.white, fontSize: 12), 
                      ),
                    ),
                    SizedBox(height: 25),

                    //resim
                    Image.asset(photoUrl),
                    SizedBox(height: 25),

                    //isim
                    Text(text,
                        style: TextStyle(
                            fontSize:18, color: Colors.black ),)

                    ],
                  ),
                );
}