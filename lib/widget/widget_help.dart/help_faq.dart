import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpFaq extends StatelessWidget {
  const HelpFaq({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _faq(
          'كيف أضيف مهمة جديدة؟',
          'من الصفحة الرئيسية اضغط على "إضافة مهمة" ثم أدخل بيانات المهمة.',
        ),

        _faq(
          'كيف أعدل على المهمة؟',
          'اضغط على المهمة التي تريد تعديلها ثم قم بتعديل البيانات وحفظها.',
        ),

        _faq(
          'كيف أحذف مهمة؟',
          'اضغط على أيقونة الحذف الموجودة بجانب المهمة.',
        ),

        _faq(
          'كيف أغير حالة المهمة؟',
          'اضغط على علامة الحالة الموجودة بجانب المهمة.',
        ),

        // _faq(
        //   'هل أستطيع رؤية مهامي فقط؟',
        //   'نعم، كل مستخدم يرى المهام الخاصة بحسابه فقط.',
        // ),

        _faq(
          'كيف أسجل الخروج؟',
          'من صفحة الملف الشخصي اضغط على تسجيل الخروج.',
        ),
      ],
    );
  }

  Widget _faq(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
            child: Text(
              answer,
              style: GoogleFonts.cairo(
                fontSize: 12,
                color: const Color(0xFF7A7C74),
              ),
            ),
          ),
        ],
      ),
    );
  }
}