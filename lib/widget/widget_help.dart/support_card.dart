import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFDFF2E7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.headset_mic_outlined,
            color: Color(0xFF1F6F5C),
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
                    color: const Color(0xFF1F6F5C),
                  ),
                ),
                Text(
                  'تواصل معنا وسنساعدك',
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    color: const Color(0xFF7A7C74),
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1F6F5C),
              foregroundColor: Colors.white,
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