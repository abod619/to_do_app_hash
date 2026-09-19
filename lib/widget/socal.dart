import 'package:flutter/material.dart';

Widget socal() {
  return SizedBox(
    width: double.infinity,
    height: 52,

    child: OutlinedButton(
      onPressed: () {},

      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide.none,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'G',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          SizedBox(width: 10),

          Text(
            'التسجيل بواسطة Google',
            style: TextStyle(
              color: Color(0xff303030),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
