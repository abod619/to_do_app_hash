import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';
import 'package:to_do_app_hash/presantions/main_page.dart';
import 'package:to_do_app_hash/service/auth.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';
import 'package:to_do_app_hash/widget/socal.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Auth? auth = Auth();
  var email = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordHidden = true;
  final green = const Color(0xff0F766E);
  
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  login() async{
    if (_formKey.currentState!.validate()) {
      await auth?.SignIn(email.text, password.text);
      Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(
          builder: ((context) => MainPage())
      ),
      (route) => false
      );

    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),

          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // اللوقو
                Container(
                  width: 95,
                  height: 95,
            
                  decoration: BoxDecoration(
                    // color: const Color(0xffDFF2E7),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(color: AppColors.boxShadow, blurRadius: 3),
                    ],
                  ),
            
                  child: Image.asset('asset/images/logo_without_back.png'),
                ),
            
                const SizedBox(height: 25),
            
                // العنوان
                const Text(
                  'مرحباً بعودتك',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.firstText,
                  ),
                ),
            
                const SizedBox(height: 8),
            
                const Text(
                  'سجل دخولك لمتابعة مهامك',
                  style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
                ),
            
                const SizedBox(height: 40),
            
                // البريد الإلكتروني
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'البريد الإلكتروني',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.firstText),
                  ),
                ),
            
                const SizedBox(height: 8),
            
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty) {
                       return 'الرجاء ادخال البريد الاكتروني ';
                    }

                    // if (value.contains('@')) {
                    //   return 'يرجى إدخال بريد إلكتروني صحيح';
                    // }

                    // return null;
                  },
                  controller: email,

                  keyboardType: TextInputType.emailAddress,
            
                  decoration: InputDecoration(
                    hintText: 'example@email.com',
            
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xff5F6065),
                    ),
            
                    filled: true,
                    fillColor: Colors.white,
            
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: green, width: 1.5),
                    ),
                  ),
                ),
            
                const SizedBox(height: 22),
            
                // كلمة المرور
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.firstText),
                  ),
                ),
            
                const SizedBox(height: 8),
            
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty) {
                       return 'الرجاء ادخال كلمة المرور';
                    }
                    if (value.length < 8) {
                      return 'أدخل كلمة مرور أكثر من 8 أحرف';
                    }
                    return null;
                  },
                  controller: password,
                  textDirection: TextDirection.rtl,
                  obscureText: isPasswordHidden,
            
                  decoration: InputDecoration(
                    hintText: '••••••••',
            
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.iconsColor,
                    ),
            
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
            
                      icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.iconsColor,
                      ),
                    ),
            
                    filled: true,
                    fillColor: Colors.white,
            
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: green, width: 1.5),
                    ),
                  ),
                ),
            
                const SizedBox(height: 12),
            
                // نسيت كلمة المرور
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'نسيت كلمة المرور؟',
                      style: TextStyle(color: green, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            
                const SizedBox(height: 15),
            
                // تسجيل الدخول
                SizedBox(
                  width: double.infinity,
                  height: 55,
            
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                      MotionToast.success(
                        title: Text("تم تسجيل الدخول بنجاح"),
                        description: Text(''),
                        );
                    },
            
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
            
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
            
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 22),
            
                // أو
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.dividerColor)),
            
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'أو',
                        style: TextStyle(color: AppColors.secondaryText),
                      ),
                    ),
            
                    Expanded(child: Divider(color: AppColors.dividerColor)),
                  ],
                ),
            
                const SizedBox(height: 22),
            
                // Google
                socal(),
            
                const SizedBox(height: 30),
            
                // إنشاء حساب
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ليس لديك حساب؟ ',
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
            
                    GestureDetector(
                      onTap: () {
                      Navigator.pushNamed(context, "SignupScreen");
                      },
            
                      child: Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
