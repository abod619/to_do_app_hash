import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_app_hash/models/note_model.dart';

class NotesService {
  final sup = Supabase.instance.client;
  String? currentUserId;

  // void getCurrentUserId() {
  //   currentUserId = sup.auth.currentUser?.id;
  // }

  // هاذي الفنكشن وظيفته تنشئ لنا ملاحظه وتخزنها في الجدول النوت
  Future<void> createNote({
    required String title,
    required String content,
    required bool status,
  }) async {

    await sup.from('notes').insert({
      'title': title,
      'content': content,
      'status': status,
    });
  }

  // هاذي الفنكشن وظيفته تجيب لنا الملاحظات من جدول النوت وتحول كل نوت الى ليست
  Future<List<Notes>> getNotes() async {
    
    // if (currentUserId == null) return [];

   try {
      final response = await sup.from('notes').select();
    return response.map((note) => Notes.fromJson(note)).toList();
   } catch (e) {
      print(e.toString());
      return[];
   }
  }

  // هاذي الفنكشن وظيفته انه تسوي تعديل للملاحظه
  Future<void> updateNote({
    required String id,
    required String title,
    required String content,
    required bool status,
  }) async {
    await sup
        .from('notes')
        .update({'title': title, 'content': content, 'status': status})
        .eq('id', id);
  }

  // هاذي الفنكشن وظيفته تحذف الملاحظه
  Future<void> deleteNote() async {
    await sup.from('notes').delete();
  }
}
// هاذا اي دي اذا سوينا واجهات تسجيل الدخول نضيف الاي دي 
//String id