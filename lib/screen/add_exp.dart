import 'package:expense_app/appstatic.dart';
import 'package:expense_app/bloc/expense_bloc.dart';
import 'package:expense_app/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String selectedTransactionType = 'Credit';
  DateTime selectedDate = DateTime.now();
  var selectedCatIndex = -1;
  var format = DateFormat.yMMMMd();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Expenses",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: "Name your Expense",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                    hintText: "Add Desc",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: amtController,
                decoration: InputDecoration(
                    hintText: "Enter Amount",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 25,
              ),
              DropdownButton(
                  value: selectedTransactionType,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedTransactionType = newValue;
                      });
                    }
                  },
                  items: ['Credit', 'Debit']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList()),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            itemCount: AppStatic.catagories.length,
                            itemBuilder: (_, index) {
                              var eachCat = AppStatic.catagories[index];
                              return InkWell(
                                onTap: () {

                                  setState(() {
                                    selectedCatIndex = index;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(21),
                                    child: Center(
                                      child: Image.asset(eachCat['img']),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  child: selectedCatIndex == -1 ? Text("Choose Expense",style: TextStyle(color: Colors.white),) : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppStatic.catagories[selectedCatIndex]["img"], width: 20,
                        height: 20,),
                      Text(" - ${AppStatic.catagories[selectedCatIndex]["name"]}",style: TextStyle(color: Colors.white),)
                    ],
                  ),),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {
                      var dateFromPicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1999, 1, 01),
                          lastDate: DateTime.now());

                      selectedDate = dateFromPicker!;
                      setState(() {});
                    },
                    child: Text(
                      format.format(selectedDate),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      var title = titleController.text.toString();
                      var desc = descController.text.toString();
                      var amt = amtController.text.toString();
                      var newExpense = ExpenseModel(
                          desc: desc,
                          title: title,
                          amt: double.parse(amt),
                          balance: 0,
                          catId: 0,
                          eType: selectedTransactionType == "Credit" ? 0 : 1,
                          timeStamp: selectedDate.millisecondsSinceEpoch.toString());

                      BlocProvider.of<ExpenseBloc>(context).add(AddExpenseEvent(newExpense: newExpense));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Add Expense",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
