import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolio/interfaces/auth_api.dart';

class AuthAPIImpl implements AuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  bool checkAuthorization() {
    return _auth.currentUser != null;
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final encryptedPassword = _encryptPassword(password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: encryptedPassword);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  String _encryptPassword(String password) {
    var bytes = utf8.encode(password);
    Digest value = sha512.convert(bytes);
    String based64Str = base64Encode(value.bytes);
    return based64Str;
  }
}
