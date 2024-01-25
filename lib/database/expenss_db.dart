
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/expense_model.dart';

class AppDataBase {
  //Singleton
  AppDataBase._();

  static final AppDataBase db = AppDataBase._();

  //expense
  static const String TABLE_NAME = "expense";
  static const String COLUMN_ID = "eId";
  static const String COLUMN_TITLE = "eTitle";
  static const String COLUMN_DESC = "eDesc";
  static const String COLUMN_TYPE = "eType"; //0 for debit and 1 for credit
  static const String COLUMN_EXPENSE_CAT_ID = "catId";
  static const String COLUMN_AMT = "amt";
  static const String COLUMN_BALANCE = "balance";
  static const String COLUMN_TIMESTAMP = "timeStamp";


  //category
  static const String TABLE_CAT_NAME = "category";
  static const String COLUMN_CAT_ID = "cId";
  static const String COLUMN_CAT_TITLE = "cTitle";
  static const String COLUMN_CAT_IMG_PATH = "cPath";

  Database? myDB;

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await initDB();
      return myDB!;
    }
  }

  Future<Database> initDB() async {
    var mDirectory = await getApplicationDocumentsDirectory();

    var dbPath = join(mDirectory.path, "expenseDB");

    return openDatabase(dbPath, version: 1, onCreate: (db, _) {
      //create your tables here..

      db.execute(
          "Create Table $TABLE_NAME ($COLUMN_ID integer primary key autoincrement, $COLUMN_TITLE text not null, $COLUMN_DESC text not null, $COLUMN_TYPE integer, $COLUMN_EXPENSE_CAT_ID integer, $COLUMN_AMT real, $COLUMN_BALANCE real, $COLUMN_TIMESTAMP text)");

      db.execute(
          "Create Table $TABLE_CAT_NAME ($COLUMN_CAT_ID integer primary key autoincrement, $COLUMN_CAT_TITLE text not null, $COLUMN_CAT_IMG_PATH text not null)");

      db.insert(TABLE_CAT_NAME, {
        COLUMN_CAT_TITLE : "Coffee",
        COLUMN_CAT_IMG_PATH : "https://icons.iconarchive.com/icons/iconarchive/fat-sugar-food/256/Drink-Coffee-icon.png",
      });


    });
  }


  Future<bool> addExpense(ExpenseModel newExpense) async{

    var db = await getDB();

    var rowsEffected = await db.insert(TABLE_NAME, newExpense.toMap());

    return rowsEffected>0;
  }

  Future<List<ExpenseModel>> getAllExpenses() async{
    var db = await getDB();

    var data = await db.query(TABLE_NAME, orderBy: "$COLUMN_TIMESTAMP DESC");

    List<ExpenseModel> arrExpenses = [];

    for(Map<String, dynamic> eachMap in data){
      arrExpenses.add(ExpenseModel.fromMap(eachMap));
    }

    return arrExpenses;
  }




}