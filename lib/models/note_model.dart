
class Notes {
  String? id;
  String? user_Id;
  String? title;
  String? content;
  bool? status ;
  String? createdAt;
 Notes({
  this.id,
  this.title,
  this.content,
  this.status,
  this.user_Id,
  this.createdAt
 });
 // هاذي الفنكشن تستقبل البيانات الي جايه من قاعدة البيانات
 factory Notes.fromJson(Map<String, dynamic> json){
   return Notes(
    id: json['id'],
    title: json['title'],
    content: json['content'],
    status: json['status'],
    user_Id: json['user_id'],
    createdAt: json['created_at'],
   );
 }

 Map<String, dynamic> toJson(){
  return {
    'id' : id,
    'title' : title,
    'content' : content,
    'status' : status,
    'user_id' : user_Id,
  
  };
 }

}