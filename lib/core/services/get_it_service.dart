import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

// بنعرف المتغير العالمي بحروف صغيرة زي شرح ثروت سامح بالظبط
final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()));

}

// كلاس وهمي عشان الـ Compiler ميزعلش لحد ما تضيف كلاسات مشروعك الفعلية
class AppModel {}