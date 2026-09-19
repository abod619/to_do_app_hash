import 'package:flutter/material.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';
import 'package:to_do_app_hash/service/notes_service.dart';

class AddTaskPage extends StatefulWidget {
  // final void Function(Map<String, dynamic>) onAddTask;

  // AddTaskPage({
  //   super.key,
  //   required this.onAddTask,
  // });

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  NotesService note = NotesService();
  List<Notes> notes = [];

  bool iscompleted = false;

  var nameTask = TextEditingController();
  var content = TextEditingController();

  @override
  void initState() {
    super.initState();
    getnotes();
  }

  getnotes() async {
    notes = await note.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF9F7F3),

      padding: const EdgeInsets.symmetric(
        horizontal: 22,
        vertical: 35,
      ),

      child: Expanded(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // عنوان المهمة
                Text(
                  'عنوان المهمة',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: nameTask,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: 'مثال: تصميم شاشة تسجيل دخول',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    prefixIcon: const Icon(
                      Icons.title,
                      color: Color(0xff5F6065),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // الوصف
                Text(
                  'الوصف',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: content,
                  textDirection: TextDirection.rtl,
                  minLines: 5,
                  maxLines: null,

                  decoration: InputDecoration(
                    hintText: 'اكتب التفاصيل المهمة هنا...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(bottom: 65),
                      child: Icon(
                        Icons.description_outlined,
                        color: Color(0xff5F6065),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // الحالة
                Text(
                  'الحالة',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    // لم يبدأ
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            iscompleted = false;
                          });
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                          ),

                          decoration: BoxDecoration(
                            color: !iscompleted
                                ? const Color(0xffDFF2E7)
                                : Colors.white,

                            borderRadius: BorderRadius.circular(15),

                            border: Border.all(
                              color: !iscompleted
                                  ? const Color(0xff0F766E)
                                  : Colors.grey,
                            ),
                          ),

                          child: Column(
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                color: !iscompleted
                                    ? const Color(0xff0F766E)
                                    : Colors.grey,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'لم يبدأ',
                                style: TextStyle(
                                  color: !iscompleted
                                      ? const Color(0xff0F766E)
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // مكتملة
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            iscompleted = true;
                          });
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                          ),

                          decoration: BoxDecoration(
                            color: iscompleted
                                ? const Color(0xffDFF2E7)
                                : Colors.white,

                            borderRadius: BorderRadius.circular(15),

                            border: Border.all(
                              color: iscompleted
                                  ? const Color(0xff0F766E)
                                  : Colors.transparent,
                            ),
                          ),

                          child: Column(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: iscompleted
                                    ? const Color(0xff0F766E)
                                    : Colors.grey,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'مكتملة',
                                style: TextStyle(
                                  color: iscompleted
                                      ? const Color(0xff0F766E)
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // زر الإضافة
                GestureDetector(
                  onTap: () {
                    setState(() {
                      note.createNote(
                        title: nameTask.text,
                        content: content.text,
                        status: iscompleted,
                      );
                    });
                  },

                  child: Container(
                    alignment: Alignment.center,

                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff0F766E),
                    ),

                    child: const Text(
                      'إضافة المهمة',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}














// import 'package:flutter/material.dart';
// import 'package:to_do_app_hash/models/note_model.dart';
// import 'package:to_do_app_hash/presantions/home_page.dart';
// import 'package:to_do_app_hash/service/notes_service.dart';

// class AddTaskPage extends StatefulWidget {
//   final void Function(Map<String, dynamic>) onAddTask;
//   AddTaskPage({super.key, required this.onAddTask});

//   @override
//   State<AddTaskPage> createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   NotesService note = NotesService();
//   List<Notes> notes = [];
//   bool iscompleted = true;

//   var nameTask = TextEditingController();
//   var content = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     getnotes();
//   }

//   getnotes() async {
//     notes = await note.getNotes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
//       child: Container(
//         child: Expanded(
//           child: ListView(
//             children: [
//               Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextFormField(
//                         controller: nameTask,
//                         decoration: InputDecoration(
//                           hint: Text(
//                             'مثال: تصميم شاشة تسجيل دخول',
//                             style: TextStyle(
//                               color: Colors.grey.withValues(alpha: 0.9),
//                               fontSize: 14,
//                             ),
//                           ),
//                           labelText: 'اسم المهمة ',
//                           labelStyle: TextStyle(
//                             color: Color(0xFF7A7C74),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               width: 1.5,
//                               color: Color(0xFF1F6F5C),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),

//                       TextFormField(
//                         controller: content,
//                         minLines: 5,
//                         maxLines: null,
//                         decoration: InputDecoration(
//                           labelText: 'الوصف',
//                           labelStyle: TextStyle(
//                             color: Color(0xFF7A7C74),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                           hint: Text('اكتب التفاصيل المهمة هنا...'),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               width: 1.5,
//                               color: Color(0xFF1F6F5C),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 50),

//                       Text('حالة المهمة'),
//                       SizedBox(height: 15),
//                       Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 iscompleted = true;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 65,
//                                 vertical: 20,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   width: 1,
//                                   color: iscompleted
//                                       ? Color(0xFF1F6F5C)
//                                       : Color(0xFF7A7C74),
//                                 ),
//                               ),
//                               child: Text(
//                                 'لم يبدأ',
//                                 style: TextStyle(
//                                   color: iscompleted
//                                       ? Color(0xFF1F6F5C)
//                                       : Color(0xFF7A7C74),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 10),

//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 iscompleted = false;
//                               });
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 65,
//                                 vertical: 20,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   width: 1,
//                                   color: iscompleted
//                                       ? Color(0xFF7A7C74)
//                                       : Color(0xFF1F6F5C),
//                                 ),
//                               ),
//                               child: Text(
//                                 'مكتملة',
//                                 style: TextStyle(
//                                   color: iscompleted
//                                       ? Color(0xFF7A7C74)
//                                       : Color(0xFF1F6F5C),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 150),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         note.createNote(
//                           title: nameTask.text,
//                           content: content.text,
//                           status: iscompleted,
//                         );
//                       });
//                     },
//                     child: Container(
//                       alignment: Alignment.center,
//                       width: 330,
//                       padding: EdgeInsets.symmetric(vertical: 20),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: Color(0xFF1F6F5C),
//                       ),
//                       child: Text(
//                         'اضافة مهمة',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
