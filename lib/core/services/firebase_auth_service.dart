import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {

Future deleteUser()async{
  await FirebaseAuth.instance.currentUser!.delete();
}

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


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }



  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
  }

}


