import 'package:flutter/material.dart';

import '../../home screen/dash_screen.dart';

// ignore: must_be_immutable
class SettingWidget extends StatelessWidget {
  SettingWidget(
      {Key? key,
      required this.stext,
      required this.sicon,
      this.trail = const Text('')})
      : super(key: key);
  String stext;
  IconData sicon;
  Widget trail;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return const ScreenDash();
        }));
        return false;
      },
      child: ListTile(
        leading: Icon(
          sicon,
          color: Theme.of(context).secondaryHeaderColor,
          size: 24,
        ),
        title: Text(
          stext,
          style: const TextStyle(fontSize: 22),
        ),
        trailing: trail,
      ),
    );
  }
}
