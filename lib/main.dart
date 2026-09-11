import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/presantions/add_task_page.dart';
import 'package:to_do_app_hash/presantions/main_page.dart';

void main() {
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
        "AddTaskPage" :(context) => AddTaskPage(),
      },
      home: MainPage(),
      
    );
  }
}