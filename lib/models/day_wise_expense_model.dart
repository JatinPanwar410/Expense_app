import 'expense_model.dart';

class DayWiseExpenseModel {
  String date;
  String amt;
  List<ExpenseModel> transection;

  DayWiseExpenseModel({
    required this.amt,
    required this.date,
    required this.transection,
  });

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "amt": amt,
      "transaction":
          transection.map((ExpenseDetails) => ExpenseDetails.toMap()).toList(),
    };
  }

  factory DayWiseExpenseModel.fromMap(Map<String, dynamic> map) {
    return DayWiseExpenseModel(
        amt: map['amt'], date: map['date'], transection: map['transection']);
  }
}
