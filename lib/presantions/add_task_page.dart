import 'package:flutter/material.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';

class AddTaskPage extends StatefulWidget {
  final void Function(Map<String, dynamic>) onAddTask;
  AddTaskPage({super.key, required this.onAddTask});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  bool iscompleted = false;

  var nameTask = TextEditingController();
  var desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
      child: Container(
        child: Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameTask,
                        decoration: InputDecoration(
                          hint: Text(
                            'مثال: تصميم شاشة تسجيل دخول',
                            style: TextStyle(
                              color: Colors.grey.withValues(alpha: 0.9),
                              fontSize: 14,
                            ),
                          ),
                          labelText: 'اسم المهمة ',
                          labelStyle: TextStyle(
                            color: Color(0xFF7A7C74),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFF1F6F5C),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      TextFormField(
                        controller: desc,
                        minLines: 5,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'الوصف',
                          labelStyle: TextStyle(
                            color: Color(0xFF7A7C74),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          hint: Text('اكتب التفاصيل المهمة هنا...'),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Color(0xFF1F6F5C),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),

                      Text('حالة المهمة'),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 65,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: iscompleted
                                      ? Color(0xFF7A7C74)
                                      : Color(0xFF1F6F5C),
                                ),
                              ),
                              child: Text(
                                'لم يبدأ',
                                style: TextStyle(
                                  color: iscompleted
                                      ? Color(0xFF7A7C74)
                                      : Color(0xFF1F6F5C),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 65,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: iscompleted
                                      ? Color(0xFF1F6F5C)
                                      : Color(0xFF7A7C74),
                                ),
                              ),
                              child: Text(
                                'مكتملة',
                                style: TextStyle(
                                  color: iscompleted
                                      ? Color(0xFF1F6F5C)
                                      : Color(0xFF7A7C74),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        final newTask = {
                          "title": nameTask.text,
                          "status": iscompleted,
                          "descri": desc.text,
                        };
                        widget.onAddTask(newTask);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 330,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF1F6F5C),
                      ),
                      child: Text(
                        'اضافة مهمة',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
