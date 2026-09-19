import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app_hash/presantions/help_support_screen.dart';
import 'package:to_do_app_hash/presantions/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Text(
                'الملف الشخصي',
                style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'إدارة حسابك وتفضيلاتك',
                style: GoogleFonts.cairo(color: Colors.grey),
              ),

              const SizedBox(height: 25),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFFDFF2E7),
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Color(0xFF1F6F5C),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                'المستخدم',
                style: GoogleFonts.cairo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                user?.email ?? '',
                style: GoogleFonts.cairo(color: const Color(0xFF7A7C74)),
              ),

              const SizedBox(height: 25),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _option(
                      Icons.person_outline,
                      'تعديل البيانات الشخصية',
                      
                    ),
                    _option(Icons.notifications_none, 'الإشعارات'),
                    // _option(Icons.palette_outlined, 'المظهر'),
                    // _option(Icons.lock_outline, 'الأمان'),
                    _option(
                      Icons.help_outline,
                      'المساعدة والدعم',
                      onTap: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HelpSupportScreen()),
                      );
                      }
                    ),
  
                    // _option(Icons.info_outline, 'حول التطبيق'),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              _logout(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF1F6F5C)),
      title: Text(title, style: GoogleFonts.cairo(fontSize: 14)),
      trailing: onTap == null
          ? Text(
              'قريبًا',
              style: GoogleFonts.cairo(
                fontSize: 11,
                color: const Color(0xFF8A8C82),
              ),
            )
          : Icon(Icons.chevron_right, color: Color(0xFF8A8C82)),
      onTap: onTap,
    );
  }

  Widget _logout(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xFFFCE9E5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: const Icon(Icons.logout, color: Color(0xFFC0392B)),
      title: Text(
        'تسجيل الخروج',
        style: GoogleFonts.cairo(
          color: const Color(0xFFC0392B),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () async {
        await Supabase.instance.client.auth.signOut();

        if (!context.mounted) return;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
          (_) => false,
        );
      },
    );
  }
}
