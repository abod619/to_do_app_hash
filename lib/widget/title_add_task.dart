import 'package:flutter/material.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

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
            color: AppColors.firstText
          ),
        ),
    
        SizedBox(height: 8,),
    
        Text(
          'أدخل تفاصيل المهمة الجديدة',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 15
          ),
        )
      ],
    ),
  );
}