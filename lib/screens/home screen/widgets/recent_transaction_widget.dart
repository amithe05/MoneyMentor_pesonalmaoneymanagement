import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


import '../../../db/functions/db_helper.dart';
import '../../../db/model/transaction_model.dart';



DbHelper dbHelper = DbHelper();

// ignore: must_be_immutable
class RecentTransaction extends StatefulWidget {
  List<TransactionModel> data;
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  RecentTransaction({Key? key, required this.data}) : super(key: key);

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: ((context, index) {
          TransactionModel dataAtIndex;
          try {
            dataAtIndex = widget.data[index];
          } catch (e) {
            return Container();
          }

          if (dataAtIndex.type == "Income") {
            return incomeTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, dataAtIndex.type, index);
          } else {
            return expenseTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, dataAtIndex.type, index);
          }
        }));
  }

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            // delete(context, index);
            setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return ScreenEditTransaction(
            //     amount: value,
            //     category: category,
            //     date: date,
            //     type: edittype,
            //     index: index,
            //   );
            // }));
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 205, 203, 203),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 224, 19, 5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Debit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('${date.day} ${widget.month[date.month - 1]}')
                          ],
                        ),
                        // Text('date')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "- $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  incomeTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            // delete(context, index);
            setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return ScreenEditTransaction(
            //     amount: value,
            //     category: category,
            //     date: date,
            //     type: edittype,
            //     index: index,
            //   );
            // }));
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 9, 177, 3),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Credit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('${date.day} ${widget.month[date.month - 1]}')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+ $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
