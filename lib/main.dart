import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app_hash/presantions/add_task_page.dart';
import 'package:to_do_app_hash/presantions/main_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey:  dotenv.env['SUPABASE_KEY']!
  );
  
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child){
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      routes: {
        "MainPage" :(context) => MainPage(),
        // "AddTaskPage" :(context) => AddTaskPage(),
      },
      home: MainPage(),
      
    );
  }
}