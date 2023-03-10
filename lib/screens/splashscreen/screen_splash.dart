import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../home screen/dash_screen.dart';
import '../onboarding screen/onboard_screen.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:const Color.fromARGB(207, 78, 3, 251),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('MoneyMentor',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
          ],
        ),
      ),
    );
  }

  void gotoonboard() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenOnboard();
    }));
  }

  void checkUserLoggedIn() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _sharedprfns = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    final _userLoggedIn = _sharedprfns.getString(saveKey);

    if (_userLoggedIn == null || _userLoggedIn.isEmpty) {
      gotoonboard();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return  ScreenDash();
      }));
    }
  }
}
