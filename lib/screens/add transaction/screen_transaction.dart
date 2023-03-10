import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneymentor/screens/add%20transaction/widget/amount_widget.dart';
import 'package:moneymentor/screens/add%20transaction/widget/category_widget.dart';
import 'package:moneymentor/screens/add%20transaction/widget/date_pick.dart';
import 'package:moneymentor/screens/add%20transaction/widget/trans_type.dart';

import '../../../db/functions/db_helper.dart';
import '../home screen/dash_screen.dart';
import '../home screen/widgets/common_widget.dart';



class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({Key? key}) : super(key: key);

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  final amountcontroller = TextEditingController();

  final categorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).secondaryHeaderColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonSizedBox(40),
                    Text(
                      'Add Transaction',
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    commonSizedBox(30),
                    const AmountWidget(),
                    commonSizedBox(20),
                    const CategoryWidget(),
                    commonSizedBox(20),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TransType()),
                    commonSizedBox(20),
                    const Datepick(),
                    commonSizedBox(20),
                    ElevatedButton(
                        onPressed: () async {
                          if (amount == 0 || category.isEmpty) {
                            showerror(context);
                          } else {
                            DbHelper dbHelper = DbHelper();
                            await dbHelper.adddata(
                                amount, selectedDate, category, type);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (ctx3) {
                              return const ScreenDash();
                            }), (route) => false);
                            amount = 0;
                            category = '';
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:customcolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)),
                        child: const Text('Add'))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showerror(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Not all data provided'),
      backgroundColor: Color.fromARGB(255, 239, 19, 3),
    ));
  }
}
