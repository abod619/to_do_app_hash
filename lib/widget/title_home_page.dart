import 'package:flutter/material.dart';

Widget titleHomePage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'المهام',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          
        ),
      ),
      SizedBox(height: 8),
      Text(
        'لديك 4 مهام هذا الاسبوع',
        style: TextStyle(
          color: Color(0xFF7A7C74),
          fontSize: 15,
          
        ),
      ),
    ],
  );
}
