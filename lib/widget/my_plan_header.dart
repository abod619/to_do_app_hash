import 'package:flutter/material.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

class MyPlanHeader extends StatelessWidget {
  const MyPlanHeader({super.key, required this.task});

final Notes task;

  String formatDate(String? data) {
    if (data == null || data.isEmpty) return "";

    final dataTime =  DateTime.parse(data);

    return '${dataTime.day}/${dataTime.month}/${dataTime.year}';
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'خطتي اليوم',
            style: TextStyle(
              color: AppColors.colorBlack,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),

          Row(
            children: [
              Icon(Icons.calendar_today_outlined, color: AppColors.iconsColor,),
              Text(
                formatDate(task.createdAt),
                style: TextStyle(
                  color: AppColors.secondaryText
                ),
                )
            ],
          )
      ],
    );
  }
}