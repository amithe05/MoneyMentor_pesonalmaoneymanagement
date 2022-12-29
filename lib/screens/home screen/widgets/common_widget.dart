import 'package:flutter/material.dart';

commonSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

 const customcolor =  Color.fromARGB(207, 78, 3, 251);

dateWidget(month, select) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: SizedBox(
      child: ChoiceChip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          month,
        ),
        labelStyle: const TextStyle(color: Colors.white),
        selected: select,
        selectedColor: customcolor,
        disabledColor: const Color.fromARGB(255, 148, 148, 148),
      ),
    ),
  );
}
