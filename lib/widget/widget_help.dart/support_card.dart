import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.boxShadow,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.headset_mic_outlined,
            color: AppColors.cardIsTrue,
            size: 35,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تحتاج إلى مساعدة؟',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardIsTrue,
                  ),
                ),
                Text(
                  'تواصل معنا وسنساعدك',
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    color: AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cardIsTrue,
              foregroundColor: AppColors.whiteColor,
              elevation: 0,
            ),
            child: Text(
              'تواصل معنا',
              style: GoogleFonts.cairo(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}