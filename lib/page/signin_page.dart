import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:llll/page/main_page.dart';
import 'package:llll/page/signup_page.dart';
import 'package:llll/servie/auth_service.dart';

class SigninPage extends StatefulWidget {
  static final  String id ="signinPage";
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();





  void _callSingUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const SignupPage();
    }));

  }


  void _doSingIn(){
    String email = emailController.text.toString().trim();
    String password = emailController.text.toString().trim();
    if(email.isEmpty || password.isEmpty) return;

    AuthService.signInUser(email, password).then((value)=>{
      responseSingInUser(value!),
    }
    );
  }


void responseSingInUser(User firebaseUser){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return const MainPage();
  }));
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
            // Email
            Container(
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

            GestureDetector(
              onTap: _doSingIn,
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
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  )),
            ),



            //singnin

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Don't have an accpunt ?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: _callSingUpPage,
                  child: const Text(
                    " Sing Up ",
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
