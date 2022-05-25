import 'package:bloc/bloc.dart';
import 'package:zero_balance/model/expense.dart';
import 'expense_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, List<Expense?>> {
  ExpenseBloc(List<Expense?> initialState) : super(initialState);

  @override
  List<Expense?> get initialState => <Expense?>[];

  @override
  Stream<List<Expense?>?> mapEventToState(ExpenseEvent event) async* {
    if (event is SetExpenses) {
      yield event.expenseList;
    } else if (event is AddExpense) {
      List<Expense?> newState = List.from(state);
      if (event.newExpense != null) {
        newState.add(event.newExpense);
      }
      yield newState;
    }
  }
}