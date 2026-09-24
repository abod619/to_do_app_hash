import 'package:flutter/material.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

class DaySelector extends StatelessWidget {
  String? day;
  String? dayNumber;
  bool isSelectedDay;

   DaySelector({
    super.key,
    required this.day,
    required this.dayNumber,
    required this.isSelectedDay
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: 80,
        
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelectedDay ? AppColors.cardIsTrue : AppColors.grayColor,
        ),
        child: Column(
          children: [
            Text('$day', style: TextStyle(color: isSelectedDay ? AppColors.whiteColor : AppColors.colorBlack, fontWeight: FontWeight.bold),),
            SizedBox(height: 3,),
            Text('$dayNumber', style: TextStyle(color: isSelectedDay ? AppColors.whiteColor : AppColors.colorBlack,fontWeight: FontWeight.bold, fontSize: 15),)
          ],
        ),
      ),
    );
  }
}