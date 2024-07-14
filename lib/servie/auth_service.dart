import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:llll/page/signin_page.dart';
class AuthService{
  static final _auth = FirebaseAuth.instance;

  static bool isLoggendIn(){
    final User? firebaseUser = _auth.currentUser;
    return firebaseUser != null;
  }

  static Future<User?> signInUser(String email,String password)async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User firebaseUser = _auth.currentUser!;
    return firebaseUser;
  }


  static Future<User?> singUpUser(String fullname, String email, String password)async{
    var authREsult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = authREsult.user;
    return user;
  }

  static void signOutUser(BuildContext context){
    _auth.signOut();
    Navigator.pushReplacementNamed(context, SigninPage.id);
  }
}