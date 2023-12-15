part of 'expense_bloc.dart';

@immutable
abstract class ExpenseState {}

class ExpenseInitial extends ExpenseState {}
class ExpenseLoading extends ExpenseState {}
class ExpenseLoaded extends ExpenseState {
  List<ExpenseModel> allExpenses;
  ExpenseLoaded({required this.allExpenses});
}
class ExpenseError extends ExpenseState {
  String errMsg;
  ExpenseError({required this.errMsg});
}
