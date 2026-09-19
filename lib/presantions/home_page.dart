import 'package:flutter/material.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/presantions/edit_task_page.dart';
import 'package:to_do_app_hash/service/notes_service.dart';
import 'package:to_do_app_hash/widget/filter_button.dart';
import 'package:to_do_app_hash/widget/task_item.dart';
import 'package:to_do_app_hash/widget/task_shimmer.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onNotesChanged;

  const HomePage({
    super.key,
    required this.onNotesChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotesService note = NotesService();
  List<Notes> notes = [];
  bool isLoadding = true;

  String filter = 'الكل';

  Future<void> getNotes() async {
    setState(() {
      isLoadding = true;
    });
    final response = await note.getNotes();
    if (!mounted) return;

    setState(() {
      notes = response;
      isLoadding = false;
    });
  }

  List<Notes> get filteredNotes {
    if (filter == 'مكتملة') {
      return notes.where((note) => note.status == true).toList();
    }

    if (filter == 'لم تبدأ') {
      return notes.where((note) => note.status == false).toList();
    }

    return notes;
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: RefreshIndicator(
        color: const Color(0xFF1F6F5C),
        onRefresh: getNotes,
        child: ListView(
          children: [
            Row(
              children: [
                FilterButton(
                  title: 'الكل',
                  selected: filter == 'الكل',
                  onTap: () {
                    setState(() {
                      filter = 'الكل';
                    });
                  },
                ),

                FilterButton(
                  title: 'مكتملة',
                  selected: filter == 'مكتملة',
                  onTap: () {
                    setState(() {
                      filter = 'مكتملة';
                    });
                  },
                ),

                FilterButton(
                  title: 'لم تبدأ',
                  selected: filter == 'لم تبدأ',
                  onTap: () {
                    setState(() {
                      filter = 'لم تبدأ';
                    });
                  },
                ),
              ],
            ),
            if(isLoadding)
              ...List.generate(3, (index) => const TaskShimmer())
            else

            ...filteredNotes.map(
              (task) => TaskItem(
                task: task,

                // فتح صفحة التعديل
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskPage(
                        note: task,
                      ),
                    ),
                  );

                  getNotes();
                  widget.onNotesChanged();
                },

                // تغيير حالة المهمة
                onStatusChanged: () async {
                  final newStatus = !(task.status ?? false);

                  setState(() {
                    task.status = newStatus;
                  });

                  await note.updateNote(
                    id: task.id!,
                    title: task.title ?? '',
                    content: task.content ?? '',
                    status: newStatus,
                  );

                  widget.onNotesChanged();
                },

                // حذف المهمة
                onDelete: () async {
                  await note.deleteNote(task.id!);

                  setState(() {
                    notes.remove(task);
                  });

                  widget.onNotesChanged();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:to_do_app_hash/models/note_model.dart';
// import 'package:to_do_app_hash/presantions/edit_task_page.dart';
// import 'package:to_do_app_hash/service/notes_service.dart';
// import 'package:to_do_app_hash/widget/title_home_page.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatefulWidget {
 
//   final VoidCallback onNotesChange;
 
//  const HomePage({
//     super.key,
//     required this.onNotesChange,
//   });
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
 
//   NotesService note = NotesService();
//   List<Notes> notes = [];


//   Future <void> getNotes() async{
//     final response = await note.getNotes();

//     setState(() {
//       notes = response;
//     });
// }
// @override
// void initState() {
//   super.initState();
//  getNotes();
// }




//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
//       child: RefreshIndicator(
//         backgroundColor: Colors.grey.withValues(alpha: 0.4),
//         color: Color(0xFF1F6F5C) ,
//         onRefresh: getNotes,
//         child: ListView.builder(
//           itemCount: notes.length,
//           itemBuilder: (context, index) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 30),
//                 GestureDetector(
//                   onTap: (){
//                     Navigator.push(
//                       context, MaterialPageRoute(
//                         builder: (context) => EditTaskPage(
//                           note: notes[index]
//                           )
//                           )
//                           );
                    
//                     getNotes();
//                   },
//                   child: Container(
//                     padding: EdgeInsets.only(bottom: 5),
//                     width: double.infinity,
                  
//                     decoration: BoxDecoration(
//                       border: Border(
//                         right: BorderSide.none,
//                         left: BorderSide.none,
//                         top: BorderSide.none,
//                         bottom: BorderSide(
//                           color: Colors.grey.withValues(alpha: 0.4),
//                         ),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               notes[index].title ?? '',
//                               style: GoogleFonts.cairo(
//                                 color: Color(0xFF20241F),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
                  
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   notes[index].status = !(notes[index].status ?? false);
//                                 });
//                               },
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 7,
//                                     height: 7,
//                                     decoration: BoxDecoration(
//                                       color: notes[index].status == true
//                                           ? Color(0xFF1F6F5C)
//                                           : Color(0xFFB7B4A8),
//                                       shape: BoxShape.circle,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: notes[index].status == true
//                                               ? Color(0xFF1F6F5C)
//                                               : Color(0xFFB7B4A8),
//                                           blurRadius: 4,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(width: 5),
                  
//                                   Text(
//                                     notes[index].status == true
//                                         ? "مكتملة"
//                                         : "لم تبدأ",
//                                     style: TextStyle(
//                                       color: notes[index].status == true
//                                           ? Color(0xFF1F6F5C)
//                                           : Color(0xFF8A8C82),
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
                  
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 maxLines: 3,
//                                 overflow: TextOverflow.ellipsis,
//                                 notes[index].content ?? '',
//                                 style: TextStyle(
//                                   color: Color(0xFF7A7C74),
//                                   fontSize: 15,
//                                 ),
                                
//                               ),
//                             ),
                  
//                             GestureDetector(
//                               onTap: ()async{
//                                 await note.deleteNote(notes[index].id!);
//                                 setState(() {
//                                  notes.removeAt(index);
//                                 });
//                                 widget.onNotesChange();
                          
//                               },
//                               child: Icon(Icons.delete, size: 20)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
