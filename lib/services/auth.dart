import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> login(String email, String password) async {
    try {
      log('$email -> mails');
      log('password $password');

      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      log('email $authResult');


      return authResult.user;
    } catch (error) {
      return null;
    }
  }
}
