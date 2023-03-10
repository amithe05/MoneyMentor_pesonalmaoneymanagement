import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../home screen/dash_screen.dart';
import '../../home screen/widgets/common_widget.dart';
import 'notification_service.dart';


class BottomSheetNot extends StatefulWidget {
  const BottomSheetNot({Key? key}) : super(key: key);

  @override
  State<BottomSheetNot> createState() => _BottomSheetNotState();
}

class _BottomSheetNotState extends State<BottomSheetNot> {
  TimeOfDay? pickedTime;
  TimeOfDay currentTimme = TimeOfDay.now();
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    NotificationService().init(initScheduled: true);
  }

  void listenNotifiication() {
    NotificationService.onNotifications.listen((onClickNotification));
  }

  onClickNotification(String? payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const ScreenDash();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 550,
        child: Column(
          children: [
            commonSizedBox(20),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Set Reminder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            commonSizedBox(30),
            Column(
              children: [
                Container(
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
                            Icons.note,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 210,
                            height: 60,
                            child: TextField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'What to Remind?',
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      pickedTime = await showTimePicker(
                          context: context, initialTime: currentTimme);
                    },
                    child: const Text(
                      'Set Timer',
                      style: TextStyle(
                          color: Color.fromARGB(255, 139, 9, 204),
                          fontSize: 19),
                    )),
                commonSizedBox(10),
                ElevatedButton(
                    onPressed: () {
                      if (pickedTime != null && pickedTime != currentTimme) {
                        setState(() {
                          NotificationService.showScheduledNotifications(
                              title: 'Money mentor',
                              body: messageController.text,
                              scheduledTime: Time(
                                  pickedTime!.hour, pickedTime!.minute, 0));
                        });
                      }
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
      ),
    );
  }
}
