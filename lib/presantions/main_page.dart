import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';
import 'package:to_do_app_hash/presantions/add_task_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    AddTaskPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F4),
      body: pages[currentIndex], 
      

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF1F6F5C),
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(
         color: const Color(0xFF1F6F5C)
        ),
        // هنا اضفنا هاذه الخصيه عشان نتحكم في التغيير عند الضغط
        onTap:(value) {

          // لازم نكون ضايفين set state عشان يعيد يتم التغيير
          setState(() {
            currentIndex = value;
            
          });
          
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'asset/icons/icon-tasks.png',
              color: currentIndex == 0 ? const Color(0xFF1F6F5C) : Colors.grey,
              width: 30,
              height: 30,
            ),
            label: "المهام",
            //backgroundColor: const Color(0xFF1F6F5C),
          ),

          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/icon-add.png', color: Colors.grey, width: 30, height: 30,),
            label: "اضافة مهمة"
          ),
        ],
      ),
    );
  }
}




























// Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'المهام',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'لديك 4 مهام هذا الاسبوع',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'تصميم شاشة تسجيل الدخول',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),

//                         Text(
//                           'اعداد واير فريم و تحديد الالوان و الخطوط \nالاساسية للشاشة',
//                           style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 50),
//                     Row(
//                       children: [
//                         Container(
//                           width: 7,
//                           height: 7,
//                           decoration: BoxDecoration(
//                             color: Color(0xFFD98A3D),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                         SizedBox(width: 5),

//                         Text(
//                           'قيد التنفيذ',
//                           style: TextStyle(
//                             color: Color(0xFFA66625),
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );