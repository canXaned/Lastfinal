

import 'package:flutter/material.dart';

Widget header(String title, context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start ,
    children: [
      SizedBox(height:29),
    
    //Geri
    GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
      child: Icon(Icons.arrow_back, color:Colors.black, size: 30)),

            //kategori
            SizedBox(height: 25),

            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF0A1034),
              ),
            ),
    ],
  );
            

}