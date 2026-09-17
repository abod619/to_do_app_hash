
class Notes {
  String? id;
  String? title;
  String? content;
  bool? status ;
 Notes({
  this.id,
  this.title,
  this.content,
  this.status,
 });
 // هاذي الفنكشن تستقبل البيانات الي جايه من قاعدة البيانات
 factory Notes.fromJson(Map<String, dynamic> json){
   return Notes(
    id: json['id'],
    title: json['title'],
    content: json['content'],
    status: json['status']
   );
 }

 Map<String, dynamic> toJson(){
  return {
    'id' : id,
    'title' : title,
    'content' : content,
    'status' : status,
  };
 }

}