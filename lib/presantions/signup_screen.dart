import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:to_do_app_hash/presantions/home_page.dart';
import 'package:to_do_app_hash/presantions/main_page.dart';
import 'package:to_do_app_hash/service/auth.dart';
import 'package:to_do_app_hash/theme/app_theme.dart';
import 'package:to_do_app_hash/widget/socal.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>() ;
  Auth? auth = Auth();

  bool isPasswordHidden = true;

  final green = const Color(0xff0F766E);
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
  void signup() async{
   if (_formKey.currentState!.validate()) {
     await auth?.SignUp(email.text, password.text);

     Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(
        builder: (context) => MainPage()
        ),
        (route) => false,
        
        );
        MotionToast.success(
          enableAnimation: true,
          title: const Text("نجح"),
          description: const Text("تم انشاء حساب بنجاح"),
          ).show(context);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),

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
            
                const SizedBox(height: 22),
            
                // العنوان
                const Text(
                  'إنشاء حساب جديد',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.firstText,
                  ),
                ),
            
                const SizedBox(height: 8),
            
                const Text(
                  'ابدأ رحلتك في تنظيم مهامك',
                  style: TextStyle(fontSize: 14, color: AppColors.secondaryText),
                ),
            
                const SizedBox(height: 35),
            
                // الاسم
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الاسم الكامل',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.firstText),
                  ),
                ),
            
                const SizedBox(height: 8),
            
                TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'الرجاء ادخال الاسم الكامل';
                    }
                  },
                  controller: name,
                  textDirection: TextDirection.rtl,
            
                  decoration: InputDecoration(
                    hintText: 'أدخل اسمك الكامل',
            
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.iconsColor,
                    ),
            
                    filled: true,
                    fillColor: AppColors.whiteColor,
            
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // البريد
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
                      color: AppColors.iconsColor,
                    ),
            
                    filled: true,
                    fillColor: AppColors.whiteColor,
            
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
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
                    fillColor: AppColors.whiteColor,
            
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
            
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                    ),
                  ),
                ),
            
                const SizedBox(height: 30),
            
                // إنشاء الحساب
                SizedBox(
                  width: double.infinity,
                  height: 55,
            
                  child: ElevatedButton(
                    onPressed: () {
                      signup();
                      
                    },
            
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
            
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
            
                    child: const Text(
                      'إنشاء الحساب',
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
            
                const SizedBox(height: 28),
            
                // تسجيل الدخول
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'لديك حساب بالفعل؟ ',
                      style: TextStyle(color: AppColors.secondaryText),
                    ),
            
                    GestureDetector(
                      onTap: () {
                       Navigator.pushNamed(context, "LoginScreen");
                      },
            
                      child: Text(
                        'تسجيل الدخول',
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
