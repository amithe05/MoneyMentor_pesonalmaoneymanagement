import 'package:flutter/material.dart';
import 'package:moneymentor/screens/settingscreen/widgets/my_theme.dart';
import 'package:provider/provider.dart';

import '../../home screen/widgets/common_widget.dart';

class ChaneButton extends StatefulWidget {
  const ChaneButton({Key? key}) : super(key: key);

  @override
  State<ChaneButton> createState() => _ChaneButtonState();
}

class _ChaneButtonState extends State<ChaneButton> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Switch.adaptive(
        activeColor:customcolor,
        value: themeChange.darkTheme,
        onChanged: (value) {
          setState(() {
          
            themeChange.darkTheme = value;
          });
        });
  }
}
