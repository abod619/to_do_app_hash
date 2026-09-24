import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerColor, 
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 180,
              color: AppColors.whiteColor,
            ),
             const SizedBox(height: 12),
              Container(
              width: double.infinity,
              height: 12,
              color: AppColors.whiteColor,
            ),

            const SizedBox(height: 8),

            Container(
              width: 130,
              height: 12,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
      );
  }
}