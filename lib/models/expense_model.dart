class Expense {
  String date;
  String amt;
  List<Transaction> transactions;

  Expense({
    required this.date,
    required this.amt,
    required this.transactions,
  });

}

class Transaction {
  String title;
  String desc;
  String amt;
  String balance;
  String catImg;

  Transaction({
    required this.title,
    required this.desc,
    required this.amt,
    required this.balance,
    required this.catImg,
  });

}

