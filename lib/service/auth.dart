import 'package:supabase_flutter/supabase_flutter.dart';

class Auth {
  final sup = Supabase.instance.client;

  Future<void> SignIn(String email, String password) async {
    final respons = await sup.auth.signInWithPassword(
      password: password.trim(),
      email: email.trim(),
    );
  }

  Future<void> SignUp(String email, String password) async {
    final respons = await sup.auth.signUp(
      password: password.trim(),
      email: email.trim(),
    );
  }

  Future<void> SignOut() async {
    await sup.auth.signOut();
  }
}
