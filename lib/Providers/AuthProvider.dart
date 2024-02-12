import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;
  // Signup
  Future<String> signUp(String email, String password) async {
    String res = 'some error occured';
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      if(credential.user != null) {
        res = 'Yes';
      } else {
        res = 'No';
      }
      return res;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "An Account Already Exist For The Provided E-mail";
          break;
        case "invalid-email":
          res = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          res = "Your password is wrong.";
          break;
        case "user-not-found":
          res = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          res = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          res = "Too many requests";
          break;
        case "operation-not-allowed":
          res = "Signing in with Email and Password is not enabled.";
          break;
        default:
          res = "An undefined Error happened.";
      }
      return res;
    }
  }

  // Login
  Future<String> login(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
      return credential.user != null? 'Yes': 'No';
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          return 'User Not Found';
        case 'wrong-password':
          return 'Wrong password, Please enter the correct password.';
        case 'invalid-credential':
          return 'Invalid Credentials';
        default:
          return 'Login Failed';
      }
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Getter to check if user is logged in
  bool get isLoggedIn => _auth.currentUser != null;
}