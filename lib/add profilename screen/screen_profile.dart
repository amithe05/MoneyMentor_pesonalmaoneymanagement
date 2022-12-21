import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({Key? key}) : super(key: key);
  final _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  const Text(
                    "MoneyMentor",
                    style: TextStyle(
                      color: Color.fromARGB(207, 6, 42, 245),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  // Image(
                  //   width: MediaQuery.of(context).size.width * 0.6,
                  //   image:
                  //       // const AssetImage('assets/images/xpense-logo-color.png'),
                  //   // width: 250,
                  // ),
                  ,
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'What should we call \n you?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.signika(
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        color: const Color.fromARGB(255, 74, 74, 74)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 228, 226),
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: _textcontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        hintText: 'Enter Your Nick Name',
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 70,
                    width: 320,
                    child: Text(
                      'By clicking the submit button below, I hereby agree to and accept the following terms and conditions governing my use of xXpense app. I further reaffirm my acceptance of the general terms and conditions .',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 109, 108, 108)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        checkLogin(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(207, 6, 42, 245),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minimumSize: const Size(150, 40)),
                      child: const Text('Submit'))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  checkLogin(context) {}
}
