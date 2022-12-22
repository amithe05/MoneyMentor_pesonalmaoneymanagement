import 'package:flutter/material.dart';
import 'package:moneymentor/screens/splashscreen/screen_splash.dart';

const saveKey = "savekey";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoneyMentor',
      theme: ThemeData(),
      home:const ScreenSplash(),
    );
  }
}
