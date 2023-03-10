import 'package:flutter/material.dart';
import 'package:moneymentor/screens/home%20screen/widgets/common_widget.dart';

import '../../home screen/widgets/custom_icons.dart';

int? amount;
int? editedamount;

// ignore: must_be_immutable
class EditAmountWidget extends StatefulWidget {
  EditAmountWidget({Key? key, required this.editAmount}) : super(key: key);
  int editAmount;

  @override
  State<EditAmountWidget> createState() => _EditAmountWidgetState();
}

class _EditAmountWidgetState extends State<EditAmountWidget> {
  final editAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    editAmountController.text = widget.editAmount.toString();
    editedamount = int.parse(editAmountController.text);
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: customcolor,
              child: Icon(
                MyFlutterApp.rupee,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  controller: editAmountController,
                  onChanged: (val) {
                    editedamount = int.parse(val);
                    //print(editedamount);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Enter Amount',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
