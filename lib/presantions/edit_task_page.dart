import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/models/note_model.dart';
import 'package:to_do_app_hash/service/notes_service.dart';

class EditTaskPage extends StatefulWidget {
final Notes note ;

 const EditTaskPage({
  required this.note
  });

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  NotesService note = NotesService();

  var nameTask = TextEditingController();
  var content = TextEditingController();

  bool isCompleted = false;

  final green = const Color(0xff0F766E);

  @override
  void initState() {
    super.initState();

    nameTask.text = widget.note.title ?? '';
    content.text = widget.note.content ?? '';
    isCompleted = widget.note.status ?? false;
  }

  Future<void> updateTask() async {
    await note.updateNote(
      id: widget.note.id!,
      title: nameTask.text,
      content: content.text,
      status: isCompleted,
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameTask.dispose();
    content.dispose();
    super.dispose();
  }

  TextStyle titleStyle() {
    return GoogleFonts.cairo(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  InputDecoration inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.cairo(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F7F3),

      appBar: AppBar(
        backgroundColor: const Color(0xffF9F7F3),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'تعديل المهمة',
          style: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(22),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('عنوان المهمة', style: titleStyle()),
              const SizedBox(height: 10),

              TextFormField(
                controller: nameTask,
                textDirection: TextDirection.rtl,
                decoration: inputDecoration(
                  'اكتب عنوان المهمة',
                  Icons.title,
                ),
              ),

              const SizedBox(height: 25),

              Text('الوصف', style: titleStyle()),
              const SizedBox(height: 10),

              TextFormField(
                controller: content,
                textDirection: TextDirection.rtl,
                maxLines: 5,
                decoration: inputDecoration(
                  'اكتب وصف المهمة',
                  Icons.description_outlined,
                ),
              ),

              const SizedBox(height: 25),

              Text('الحالة', style: titleStyle()),
              const SizedBox(height: 10),

              Row(
                children: [
                  statusButton(
                    title: 'لم يبدأ',
                    completed: false,
                  ),

                  const SizedBox(width: 12),

                  statusButton(
                    title: 'مكتملة',
                    completed: true,
                  ),
                ],
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: updateTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'حفظ التعديل',
                    style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statusButton({
    required String title,
    required bool completed,
  }) {
    final selected = isCompleted == completed;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCompleted = completed;
          });
        },

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),

          decoration: BoxDecoration(
            color: selected
                ? (completed
                    ? const Color(0xffDFF2E7)
                    : const Color(0xffE8E8E8))
                : Colors.white,

            borderRadius: BorderRadius.circular(15),

            border: Border.all(
              color: selected && completed
                  ? green
                  : Colors.transparent,
            ),
          ),

          child: Column(
            children: [
              Icon(
                completed
                    ? Icons.check_circle_outline
                    : Icons.circle_outlined,
                color: selected && completed
                    ? green
                    : Colors.grey,
              ),

              const SizedBox(height: 5),

              Text(
                title,
                style: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: selected && completed ? green : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}