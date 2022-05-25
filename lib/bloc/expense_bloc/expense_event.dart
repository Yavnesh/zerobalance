import 'package:equatable/equatable.dart';
import 'package:zero_balance/model/expense.dart';

abstract class ExpenseEvent extends Equatable{
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class AddExpense extends ExpenseEvent {
  Expense? newExpense;

  AddExpense(Expense expense) {
    newExpense = expense;
  }
}

class SetExpenses extends ExpenseEvent {
  List<Expense>? expenseList;

  SetExpenses(List<Expense> expenses) {
    expenseList = expenses;
  }
}