import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app_hash/models/note_model.dart';

class TaskItem extends StatelessWidget {
  final Notes task;
  final VoidCallback onTap;
  final VoidCallback onStatusChanged;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onTap,
    required this.onStatusChanged,
    required this.onDelete,
  });

  String formatDate(String? date) {
    if (date == null) return '';

    final dateTime = DateTime.parse(date);

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    final completed = task.status == true;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: completed
              ? const Color(0xFFDFF2E7).withValues(alpha: 0.65)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task.title ?? '',
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF20241F),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: onStatusChanged,
                  child: Icon(
                    completed
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: completed
                        ? const Color(0xFF1F6F5C)
                        : const Color(0xFFB7B4A8),
                    size: 27,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              task.content ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(
                fontSize: 13,
                color: const Color(0xFF7A7C74),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  completed ? 'مكتملة' : 'لم تبدأ',
                  style: GoogleFonts.cairo(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: completed
                        ? const Color(0xFF1F6F5C)
                        : const Color(0xFF8A8C82),
                  ),
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      size: 14,
                      color: Color(0xFF8A8C82),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      formatDate(task.createdAt),
                      style: GoogleFonts.cairo(
                        fontSize: 11,
                        color: const Color(0xFF8A8C82),
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: onDelete,
                  child: const Icon(
                    Icons.delete_outline,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}