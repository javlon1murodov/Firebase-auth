
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:llll/page/main_page.dart';
import 'package:llll/page/signin_page.dart';
import 'package:llll/page/signup_page.dart';
import 'package:llll/page/splash_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const  FirebaseOptions(
        apiKey: "AIzaSyBw6PaE3kql9RKxjL-XSPYg3LlsDS6seY4",
        appId: "1:224150529687:android:2f9f8c571c118c6cb86bd2",
        messagingSenderId:"224150529687",
        projectId: "lllll-fc4a4"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashPage(),
      routes: {
        SplashPage.id:(context) => const SplashPage(),
        SignupPage.id:(context) => const SignupPage(),
        SigninPage.id:(context) => const SigninPage(),
        MainPage.id:(context) => const MainPage(),
      },
    );
  }
}
