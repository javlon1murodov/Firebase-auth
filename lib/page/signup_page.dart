import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:llll/page/main_page.dart';
import 'package:llll/page/signin_page.dart';
import 'package:llll/servie/auth_service.dart';

import '../servie/log_service.dart';
class SignupPage extends StatefulWidget {
  static final  String  id = "sigup_page";
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var passwordController= TextEditingController();
  var emailController = TextEditingController();
  var fullnameController  = TextEditingController();
  var confirmpasswordController = TextEditingController();



  void  _doSingUp(){
    String fullname = fullnameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String  confirmpassword = confirmpasswordController.text.toString().trim();

    if(fullname.isEmpty || email.isEmpty || password.isEmpty ||confirmpassword.isEmpty) return;

    if(confirmpassword != password){
      LogService.i("Password and confirm password does not match");

      return;
    }
    AuthService.singUpUser(fullname, email, password).then((value)=>{
      responseSingUp(value!),
    });




  }

  void responseSingUp(User firebaseUser){
    Navigator.pushReplacementNamed(context,  MainPage.id);

  }


 void _callSingInPage(){
    Navigator.pushReplacementNamed(context, SigninPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(193, 53, 132, 1),
                  Color.fromRGBO(131, 58, 180, 1),
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //fullname
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: fullnameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Fullname",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),


            // Email
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),

            //password
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: passwordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),



            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white54.withOpacity(0.2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: confirmpasswordController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: "Confirm Password",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 17, color: Colors.white54)),
              ),
            ),

            GestureDetector(
              onTap: _doSingUp,
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )),
            ),



            //singnin

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Already have an account ?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap:_callSingInPage,
                  child: const Text(
                    " Sing In ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
