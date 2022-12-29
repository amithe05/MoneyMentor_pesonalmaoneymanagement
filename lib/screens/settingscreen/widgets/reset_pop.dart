import 'package:flutter/material.dart';
import 'package:moneymentor/screens/splashscreen/screen_splash.dart';

import '../../all transaction screen/widgets/all_trans_widget.dart';

void resetPop(ctx) {
  showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to reset the data?'),
          actions: [
            TextButton(
                onPressed: () async {
                  dbHelper.resetData();
                  dbHelper.resetShared();

                  Navigator.of(ctx).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) {
                    return const ScreenSplash();
                  }), (route) => false);
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}
