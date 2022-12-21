import 'package:flutter/material.dart';
import 'package:moneymentor/add%20profilename%20screen/screen_profile.dart';

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
      theme: ThemeData(
       
      ),
    home: ScreenProfile(),
    );
  }
}

