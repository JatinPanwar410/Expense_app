import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/screen/add_exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ExpenseBloc>(context).add(FetchAllExpenseEvent());
  }
  @override
  Widget build(BuildContext context) {
    var bal = 0;
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
                      image: DecorationImage(
                        image: AssetImage("assets/image/download.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(75),
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Xavier Uncle",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Xavier@spendo.com",
                  style: GoogleFonts.roboto(color: Colors.grey),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("BALANCE"),
                SizedBox(height: 20,),
                Center(
                  child: Text(bal.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder<ExpenseBloc,ExpenseState>(builder: (ctx,state){
                  return Container();
                })

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(side: BorderSide(color: Colors.white)),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddExpense(),));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Expanded(child: ListView.builder(
// itemCount: data.length,
// itemBuilder: (_,parentIndex){
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(data[parentIndex]['date'].toString()),
// Text(data[parentIndex]['amt'].toString()),
// ],
// ),
// ListView.builder(
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemCount: (data[parentIndex]['transactions'] as List<Map<String,dynamic>>).length,
// itemBuilder: (_,childIndex){
// Map<String,dynamic> eachTransactions = (data[parentIndex]['transactions'] as List<Map<String,dynamic>>)[childIndex];
// return ListTile(
// leading: Image.network(eachTransactions['catImg']),
// title: Text(eachTransactions['title']),
// subtitle: Text(eachTransactions['desc']),
// trailing: Column(
// children: [
// Text(eachTransactions['amt']),
// Text(eachTransactions['balance'])
// ],
// ),
// );
// })
// ],
// ),
// );
// })),
