import 'dart:async';

import 'package:flutter/material.dart';
import 'package:llll/page/main_page.dart';
import 'package:llll/page/signin_page.dart';
import 'package:llll/page/signup_page.dart';
import 'package:llll/servie/auth_service.dart';

class SplashPage extends StatefulWidget {
  static final String id="splashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _inirTimer();
  }

  void _inirTimer(){
    Timer(
       const Duration(seconds: 2), (){
         _callNextPage();
    }
    );

  }
  //Splash page

 _callNextPage(){

    if(AuthService.isLoggendIn()){
      Navigator.pushReplacementNamed(context,MainPage.id);

    }else{
      Navigator.pushReplacementNamed(context, SigninPage.id);

    }
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const SigninPage();
    }));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(193, 53, 132, 1),
              Color.fromRGBO(131, 58, 180, 1),
            ])),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Center(
                  child: Text("Instagram", style:  TextStyle(color:Colors.white, fontSize: 35 ),),
                )
            ),
            Text(
              "All rights reserved",
              style: TextStyle(color: Colors.white,
                  fontSize: 16),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
