import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app_hash/presantions/add_task_page.dart';
import 'package:to_do_app_hash/presantions/deily_plan_screen.dart';
import 'package:to_do_app_hash/presantions/edit_task_page.dart';
import 'package:to_do_app_hash/presantions/login_screen.dart';
import 'package:to_do_app_hash/presantions/main_page.dart';
import 'package:to_do_app_hash/presantions/profile_screen.dart';
import 'package:to_do_app_hash/presantions/signup_screen.dart';
import 'package:to_do_app_hash/presantions/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey:  dotenv.env['SUPABASE_KEY']!
  );

  await initializeDateFormatting('ar');
  
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child){
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      routes: {
        "MainPage" :(context) => MainPage(),
        // "EditTaskPage" :(context) => EditTaskPage()
        // "AddTaskPage" :(context) => AddTaskPage(),
        "SignupScreen" :(context) => SignupScreen(),
        'LoginScreen' :(context) => LoginScreen()
      },
      home: DeilyPlanScreen(),
      
    );
  }
}