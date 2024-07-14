import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static final String id ="MainPage";
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("khv"),
      )
    );
  }
}
