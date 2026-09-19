import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE5E3DE), 
      highlightColor: const Color(0xFFF7F6F2),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 180,
              color: Colors.white,
            ),
             const SizedBox(height: 12),
              Container(
              width: double.infinity,
              height: 12,
              color: Colors.white,
            ),

            const SizedBox(height: 8),

            Container(
              width: 130,
              height: 12,
              color: Colors.white,
            ),
          ],
        ),
      ),
      );
  }
}