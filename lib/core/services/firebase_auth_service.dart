import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}, code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السرى ضعيف جداً');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد تم استخدام هذا البريد الالكتروني بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من اتصالك بالانترنت وحاول مرة أخرى');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ. يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ. يرجى المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}, code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'البريد اللإلكترونى او كلمة المرور غير صحيحة');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'البريد اللإلكترونى او كلمة المرور غير صحيحة');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'البريد اللإلكترونى او كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من اتصالك بالانترنت وحاول مرة أخرى');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ. يرجى المحاولة مرة أخرى.');
      }
    } catch (e) {
      throw CustomException(message: 'لقد حدث خطأ. يرجى المحاولة مرة أخرى.');
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
