import 'package:flutter/material.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

Widget titleHomePage({required int taskCount}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المهام',
          style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'لديك $taskCount مهام هذا الاسبوع',
          style: TextStyle(
            color: AppColors.secondaryText,
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}
