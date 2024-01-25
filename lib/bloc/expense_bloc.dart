
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../database/expenss_db.dart';
import '../models/expense_model.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  AppDataBase db;
  ExpenseBloc({required this.db}) : super(ExpenseInitial()) {
    on<AddExpenseEvent>((event, emit)async{
      emit(ExpenseLoading());
      var check = await db.addExpense(event.newExpense);

      if(check){
        var allExp = await db.getAllExpenses();
        emit(ExpenseLoaded(allExpenses: allExp));
      }else{
        emit(ExpenseError(errMsg: "Expense Not Added"));
      }
    });

    on<FetchAllExpenseEvent>((event, emit)async{
      emit(ExpenseLoading());
      var allExp = await db.getAllExpenses();
      emit(ExpenseLoaded(allExpenses: allExp));
    });
  }
}
