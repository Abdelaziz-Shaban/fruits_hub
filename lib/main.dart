import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // 👈 الـ import ده مهم جداً عشان مكتبات التعريب تشتغل
import 'package:fruit_hub/core/app_route/app_routes_name.dart';
import 'package:fruit_hub/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'core/services/get_it_service.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetIt();
  runApp(const FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)
      ),
      localizationsDelegates:  [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // 2. تحديث اللغة الافتراضية للتطبيق (مثلاً يبدأ عربي علطول) 👇
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesName.splash,
      routes: Routes.routes,
    );
  }
}
