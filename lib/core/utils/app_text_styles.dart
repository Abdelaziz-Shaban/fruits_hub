import 'package:flutter/material.dart';

abstract class AppTextStyles {
  // 1. العناوين الضخمة جداً (زي العناوين الرئيسية في الـ Onboarding الكبيرة)
  static const TextStyle bold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0C1D0F), // اللون الغامق الأساسي للنصوص في الديزاين
  );

  // 2. عناوين الشاشات والـ AppBar والـ Onboarding العادية
  static const TextStyle bold19 = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0C1D0F),
  );

  // 3. الخطوط النصية المتوسطة والبارزة (زي اسم المستخدم أو العناوين الفرعية المهمة)
  static const TextStyle semiBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600, // Semi-bold
    color: Color(0xFF0C1D0F),
  );

  // 4. خط الزرار الافتراضي (زي "ابدأ الآن" - بيكون बोल्ड وواضح وسط الزرار)
  static const TextStyle bold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white, // أبيض عشان يظبط فوق الأزرار الخضراء
  );

  // 5. النصوص العادية، الشروحات، وبودي الـ Onboarding (المكتوب بالرمادي الفاتح)
  static const TextStyle regular13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal, // Regular
    color: Color(0xFF4E5556), // الرمادي الهادئ المريح للعين في الشرح
  );

  // 6. خط زرار "تخطي" أو الروابط الصغيرة
  static const TextStyle semiBold13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color(0xFF949D9E), // رمادي فاتح لزر التخطي
  );

  // 7. الخطوط الصغيرة جداً (زي التقييمات، تفاصيل العملات أو الشروحات الدقيقة)
  static const TextStyle regular11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    color: Color(0xFFA7A7A7),
  );
}