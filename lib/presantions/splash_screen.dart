import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

changeScreen(){
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushNamed(context, 'LoginScreen');
      }
      );
    }

    @override
    void initState() {
      changeScreen();
      super.initState();
      
      
    }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: const Color(0xffF9F7F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
           Spacer(),
            Image.asset(
              'asset/images/logo_without_back.png',
              width: 170,
            ),

            const SizedBox(height: 20),

            const Text(
              'مهامي',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff0F766E),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'نظم يومك .. نحو إنجاز أفضل',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff7A7C74),
              ),
            ),

            const SizedBox(height: 45),

            const SizedBox(
              width: 170,
              child: LinearProgressIndicator(
                minHeight: 6,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                backgroundColor: Color(0xffDFF2E7),
                color: Color(0xff0F766E),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'جاري التحميل ...',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff7A7C74),
              ),
            ).animate().fadeIn(duration: 600.ms).then().fadeOut(duration: 600.ms),

            const SizedBox(height: 170),
            Spacer(),
            const Text(
              'تم التطوير بواسطة\nabodDeve',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff7A7C74),
                height: 1.7,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}