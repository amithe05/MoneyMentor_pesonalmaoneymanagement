import 'package:flutter/material.dart';
import 'package:moneymentor/screens/home%20screen/widgets/common_widget.dart';

import '../../home screen/widgets/custom_icons.dart';

String category = '';
String editedCategory = '';

// ignore: must_be_immutable
class EditCategoryWidget extends StatefulWidget {
  EditCategoryWidget({Key? key, required this.editCategory}) : super(key: key);
  String editCategory;

  @override
  State<EditCategoryWidget> createState() => _EditCategoryWidgetState();
}

class _EditCategoryWidgetState extends State<EditCategoryWidget> {
  final editCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    editCategoryController.text = widget.editCategory;
    editedCategory = editCategoryController.text;
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
                MyFlutterApp.category,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  controller: editCategoryController,
                  onChanged: (val) {
                    editedCategory = val;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Category',
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
