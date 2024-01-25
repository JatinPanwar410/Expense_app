import 'package:expense_app/appstatic.dart';
import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:expense_app/screen/add_exp.dart';
import 'package:expense_app/screen/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/day_wise_expense_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DayWiseExpenseModel> dayWiseExpense = [];
  double balance = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    // var data = AppStatic().dummyExpense;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      // image: const DecorationImage(
                      //   image: AssetImage("assets/image/c7fntZdB_400x400.jpg"),
                      // ),
                      borderRadius: BorderRadius.circular(75),
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Jatin Panwar",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Xavier@spendo.com",
                  style: GoogleFonts.roboto(color: Colors.grey),
                ),
                const SizedBox(
                  height: 25,
                ),
                // const Text("BALANCE"),
                // const SizedBox(
                //   height: 20,
                // ),
                // Center(
                //   child: Text("$balance",
                //     style: const TextStyle(
                //         fontSize: 50,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.black),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: BlocBuilder<ExpenseBloc, ExpenseState>(
                      builder: (ctx, state) {
                        if (state is ExpenseLoaded) {
                          filterExpenseDateWise(state.allExpenses);
                          balance = state.allExpenses.isNotEmpty ? state
                              .allExpenses.last.balance.toDouble() : 0.0;
                          return ListView.builder(
                              itemCount: dayWiseExpense.length,
                              itemBuilder: (_, parentIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(dayWiseExpense[parentIndex]
                                              .date
                                              .toString()),
                                          Text(dayWiseExpense[parentIndex]
                                              .amt
                                              .toString()),
                                        ],
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                          const NeverScrollableScrollPhysics(),
                                          itemCount:
                                          dayWiseExpense[parentIndex]
                                              .transection
                                              .length,
                                          itemBuilder: (_, childIndex) {
                                            ExpenseModel eachTransactions =
                                            dayWiseExpense[parentIndex]
                                                .transection[childIndex];
                                            return ListTile(
                                              leading: Image.asset(AppStatic.catagories[eachTransactions.catId]['image']),
                                              title: Text(
                                                  eachTransactions.title),
                                              subtitle:
                                              Text(eachTransactions.desc),
                                              trailing: Column(
                                                children: [
                                                  Text(
                                                    eachTransactions.amt
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                  Text(eachTransactions.balance.toString())
                                                ],
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                );
                              });
                        }
                        return Container();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.black,
            shape: const CircleBorder(side: BorderSide(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatsPage(mData: dayWiseExpense,),
                  ));
            },
            child: const Icon(Icons.auto_graph_outlined,color: Colors.white,),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.black,
            shape: const CircleBorder(side: BorderSide(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddExpense(mBalance: balance),
                  ));
            },
            child: const Icon(Icons.add,color: Colors.white,),
          ),
        ],
      ),
    );
  }

  void filterExpenseDateWise(List<ExpenseModel> allExp) {
    dayWiseExpense.clear();

    List<String> arrUniqueDate = [];

    for (ExpenseModel eachExp in allExp) {
      var dateTime = DateTime.fromMillisecondsSinceEpoch(
          int.parse(eachExp.timeStamp));
      var dateFormat = DateFormat.yMd();
      var formattedDate = dateFormat.format(dateTime);

      if (!arrUniqueDate.contains(formattedDate)) {
        arrUniqueDate.add(formattedDate);
      }
    }

    for (String eachDate in arrUniqueDate) {
      List<ExpenseModel> eachDateExpense = [];
      double amt = 0;

      for (ExpenseModel eachExpense in allExp) {
        var dateTime = DateTime.fromMillisecondsSinceEpoch(
            int.parse(eachExpense.timeStamp));
        var dateFormat = DateFormat.yMd();
        var formattedDate = dateFormat.format(dateTime);

        if (formattedDate == eachDate) {
          eachDateExpense.add(eachExpense);
          if (eachExpense.eType == 0) {
            amt -= eachExpense.amt;
          } else {
            amt += eachExpense.amt;
          }
        }
      }
      var dateTime = DateTime.now();
      var dateFormat = DateFormat.yMd();
      var formattedDate = dateFormat.format(dateTime);

      if (formattedDate == eachDate) {
        eachDate = 'Today';
      }

      var dateTimeYesterday = DateTime.now().subtract(const Duration(days: 1));
      var formattedDateYesterday = dateFormat.format(dateTimeYesterday);
      if (formattedDateYesterday == eachDate) {
        eachDate = 'Yesterday';
      }

      dayWiseExpense.add(DayWiseExpenseModel(
          amt: amt.toString(), date: eachDate, transection: eachDateExpense));
    }
  }


// void filterExpenseMonthWise(List<ExpenseModel> allExp){
//   dayWiseExpense.clear();
//
//   List<String> arrUniqueMonth = [];
//
//   for(ExpenseModel eachExp in allExp){
//     var dateTimeMonth = DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.timeStamp));
//     var dateFormat = DateFormat.y();
//     var formattedMonth = dateFormat.format(dateTimeMonth);
//     print(formattedMonth);
//
//     if(!arrUniqueMonth.contains(formattedMonth)){
//       arrUniqueMonth.add(formattedMonth);
//     }
//   }
//   print(arrUniqueMonth);
//
//   for(String eachDate in arrUniqueMonth){
//     List<ExpenseModel> eachMonthExpense = [];
//     double amt = 0;
//
//     for(ExpenseModel eachExpense in allExp){
//       var dateTimeMonth = DateTime.fromMillisecondsSinceEpoch(int.parse(eachExpense.timeStamp));
//       var dateFormat = DateFormat.y();
//       var formattedMonth = dateFormat.format(dateTimeMonth);
//
//       if(formattedMonth==eachDate){
//         eachMonthExpense.add(eachExpense);
//                 if(eachExpense.eType==0){
//                   amt -= eachExpense.amt;
//                 }else{
//                   amt += eachExpense.amt;
//                 }
//               }
//             }
//     var dateTime = DateTime.now();
//         var dateFormat = DateFormat.y();
//         var formattedDate = dateFormat.format(dateTime);
//
//         if(formattedDate==eachDate){
//           eachDate='This Year';
//         }
//
//         ///prev month
//         var dateTimePrevMonth = DateTime(DateTime.now().year-1);
//         var formattedDateYesterday = dateFormat.format(dateTimePrevMonth);
//         if(formattedDateYesterday==eachDate){
//           eachDate = 'Prev year';
//         }
//
//         dayWiseExpense.add(DayWiseExpenseModel(amt: amt.toString(), date: eachDate, transection: eachMonthExpense));
//     }
//   }
//
//

}