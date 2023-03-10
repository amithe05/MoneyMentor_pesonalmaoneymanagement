
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_widget.dart';


// ignore: must_be_immutable
class BalanceCard extends StatefulWidget {
  int totalbal;
  int totalIncome;
  int totalExpense;

  BalanceCard(
      {Key? key,
      required this.totalbal,
      required this.totalIncome,
      required this.totalExpense})
      : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(colors: [customcolor,
            Color.fromARGB(255, 2, 2, 93)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        children: [
          commonSizedBox(30),
          Text(
            'Total Balance',
            style: GoogleFonts.signikaNegative(
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
          ),
          commonSizedBox(3),
          AutoSizeText(
            '\u{20B9} ${widget.totalbal < 0 ? 0 : widget.totalbal} ',
            maxLines: 1,
            style: GoogleFonts.signikaNegative(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 36)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 196, 195, 195),
                        child: Icon(
                          Icons.arrow_downward,
                          color: Color.fromARGB(255, 4, 135, 9),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Income',
                            style: TextStyle(color: Colors.white),
                          ),
                          AutoSizeText(
                            '\u{20B9} ${widget.totalIncome}',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 196, 195, 195),
                        child: Icon(
                          Icons.arrow_upward,
                          color: Color.fromARGB(255, 201, 17, 4),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          const Text('Expense',
                              style: TextStyle(color: Colors.white)),
                          AutoSizeText(
                            '\u{20B9} ${widget.totalExpense}',
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.start,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
