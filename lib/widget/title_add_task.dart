import 'package:flutter/material.dart';

Widget TitleAddTask(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أضافة مهمة',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
    
        SizedBox(height: 8,),
    
        Text(
          'أدخل تفاصيل المهمة الجديدة',
          style: TextStyle(
            color: Color(0xFF7A7C74),
            fontSize: 15
          ),
        )
      ],
    ),
  );
}