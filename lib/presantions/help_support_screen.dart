import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/widget/widget_help.dart/help_faq.dart';
import 'package:to_do_app_hash/widget/widget_help.dart/support_card.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF8F4),
        scrolledUnderElevation: 0,
        title: Text(
          'المساعدة والدعم',
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
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
                color: const Color(0xFF7A7C74),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xFFDFF2E7),
                child: Icon(
                  Icons.support_agent_outlined,
                  size: 60,
                  color: Color(0xFF1F6F5C),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'الأسئلة الشائعة',
              style: GoogleFonts.cairo(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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