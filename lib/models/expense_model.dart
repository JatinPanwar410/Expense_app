import 'package:expense_app/database/expenss_db.dart';

class ExpenseModel {
  int eId;
  int catId;
  int eType;
  num amt;
  num balance;
  String title;
  String desc;
  String timeStamp;

  ExpenseModel({this.eId=0,
    required this.desc,
    required this.title,
    required this.amt,
    required this.balance,
    required this.catId,
    required this.eType,
    required this.timeStamp,
});

  factory ExpenseModel.fromMap(Map<String,dynamic> map){
    return ExpenseModel(
      eId: map[AppDataBase.COLUMN_ID],
        desc: map[AppDataBase.COLUMN_DESC],
        title: map[AppDataBase.COLUMN_TITLE],
        amt: map[AppDataBase.COLUMN_AMT],
        balance: map[AppDataBase.COLUMN_BALANCE],
        catId: map[AppDataBase.COLUMN_CAT_ID],
        eType: map[AppDataBase.COLUMN_TYPE],
        timeStamp: map[AppDataBase.COLUMN_TIMESTAMP]);
  }

  Map<String,dynamic> toMap(){
    return{
      AppDataBase.COLUMN_ID : eId,
      AppDataBase.COLUMN_CAT_ID : catId,
      AppDataBase.COLUMN_TYPE : eType,
      AppDataBase.COLUMN_TITLE : title,
      AppDataBase.COLUMN_DESC : desc,
      AppDataBase.COLUMN_AMT : amt,
      AppDataBase.COLUMN_TIMESTAMP : timeStamp,
      AppDataBase.COLUMN_BALANCE : balance,
    };
  }
}