import 'package:flutter/material.dart';

import '../../home screen/widgets/common_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        children: [
          commonSizedBox(10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          commonSizedBox(10),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                    ''' This privacy notice for this Application describes how and why we might collect, store, use, and/or share ("process") your information when you use our services ("Services"), such as when you:

Questions or concerns?If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at support@moneymentor.com.'''),
              ),
              commonSizedBox(40),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:customcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: const Size(150, 40)),
                  child: const Text('Done'))
            ],
          )
        ],
      ),
    );
  }
}
