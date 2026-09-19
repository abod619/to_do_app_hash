import 'package:flutter/material.dart';

Widget titleHomePage({required int taskCount}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Column(
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
          'لديك $taskCount مهام هذا الاسبوع',
          style: TextStyle(
            color: Color(0xFF7A7C74),
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}
