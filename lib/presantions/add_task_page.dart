import 'package:flutter/material.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';
import 'package:to_do_app_hash/service/notes_service.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';

class AddTaskPage extends StatefulWidget {

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
      color: AppColors.background,

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
                    color: AppColors.firstText,
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: nameTask,
                  decoration: InputDecoration(
                    hintText: 'مثال: تصميم شاشة تسجيل دخول',
                    hintStyle: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 14,
                    ),

                    filled: true,
                    fillColor: AppColors.whiteColor,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    prefixIcon: const Icon(
                      Icons.title,
                      color: AppColors.iconsColor,
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
                    color: AppColors.firstText,
                  ),
                ),

                const SizedBox(height: 10),

                TextFormField(
                  controller: content,
                  minLines: 5,
                  maxLines: null,

                  decoration: InputDecoration(
                    hintText: 'اكتب التفاصيل المهمة هنا...',
                    hintStyle: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: 14,
                    ),

                    filled: true,
                    fillColor: AppColors.whiteColor,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),

                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(bottom: 65),
                      child: Icon(
                        Icons.description_outlined,
                        color: AppColors.iconsColor,
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
                    color: AppColors.firstText,
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
                                ? AppColors.boxShadow
                                : AppColors.whiteColor,

                            borderRadius: BorderRadius.circular(15),

                            border: Border.all(
                              color: !iscompleted
                                  ? AppColors.primary
                                  : AppColors.cardIsNotTrue,
                            ),
                          ),

                          child: Column(
                            children: [
                              Icon(
                                Icons.circle_outlined,
                                color: !iscompleted
                                    ? AppColors.primary
                                    : AppColors.iconsColor,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'لم يبدأ',
                                style: TextStyle(
                                  color: !iscompleted
                                      ? AppColors.primary
                                      : AppColors.firstText,
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
                                ? AppColors.boxShadow
                                : AppColors.whiteColor,

                            borderRadius: BorderRadius.circular(15),

                            border: Border.all(
                              color: iscompleted
                                  ? AppColors.primary
                                  : AppColors.cardIsNotTrue,
                            ),
                          ),

                          child: Column(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: iscompleted
                                    ? AppColors.primary
                                    : AppColors.iconsColor,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                'مكتملة',
                                style: TextStyle(
                                  color: iscompleted
                                      ? AppColors.primary
                                      : AppColors.firstText,
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
                      color: AppColors.primary,
                    ),

                    child: const Text(
                      'إضافة المهمة',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
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
