import 'package:flutter/material.dart';
import 'package:to_do_app_hash/widget/title_home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleHomePage(),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide.none,
                left: BorderSide.none,
                top: BorderSide.none,
                bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.5)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تصميم شاشة تسجيل الدخول',
                      style: GoogleFonts.cairo(
                        color: Color(0xFF20241F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                         
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Color(0xFFD98A3D),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),

                        Text(
                          'قيد التنفيذ',
                          style: TextStyle(
                            color: Color(0xFFA66625),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),

                Text(
                  'اعداد واير فريم و تحديد الالوان و الخطوط \nالاساسية للشاشة',
                  style: TextStyle(
                    color: Color(0xFF7A7C74),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
