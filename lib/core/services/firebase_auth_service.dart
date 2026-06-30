import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} -> And code is ${e.code}',
      );

      if (e.code == 'weak-password') {
        throw CustomException(message: "كلمة المرور ضعيفة للغاية.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: "هذا الحساب موجود بالفعل.");
      }else if(e.code=="network-request-failed") {
        throw CustomException(
          message: "تأكد من اتصالك بالانتر نت وحاول مره اخرى.",
        );
      }
      else {
        throw CustomException(
          message: "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.",
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );

      throw CustomException(
        message: "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.",
      );
    }
  }



  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()} -> And code is ${e.code}',
      );

      if (e.code == 'user-not-found') {
        throw CustomException(message: "البريد الالكتروني او الرقم السري غير صحيح.");
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: "البريد الالكتروني او الرقم السري غير صحيح.");
      }else if(e.code=="network-request-failed") {
        throw CustomException(
          message: "تأكد من اتصالك بالانتر نت وحاول مره اخرى.",
        );
      }
      else {
        throw CustomException(
          message: "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.",
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword : ${e.toString()}',
      );

      throw CustomException(
        message: "حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقاً.",
      );
    }
  }



}


