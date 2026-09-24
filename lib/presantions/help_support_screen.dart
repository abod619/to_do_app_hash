import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';
import 'package:to_do_app_hash/widget/widget_help.dart/help_faq.dart';
import 'package:to_do_app_hash/widget/widget_help.dart/support_card.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0,
        title: Text(
          'المساعدة والدعم',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: AppColors.firstText
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نحن هنا لمساعدتك دائمًا',
              style: GoogleFonts.cairo(
                color: AppColors.secondaryText,
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.cardIsCompleted,
                child: const Icon(
                  Icons.support_agent_outlined,
                  size: 60,
                  color: AppColors.cardIsTrue,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'الأسئلة الشائعة',
              style: GoogleFonts.cairo(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.firstText
              ),
            ),

            const SizedBox(height: 10),

            const HelpFaq(),

            const SizedBox(height: 20),

            const SupportCard(),
          ],
        ),
      ),
    );
  }
}