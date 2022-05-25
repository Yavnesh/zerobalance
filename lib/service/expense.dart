// import 'package:localstorage/localstorage.dart';
// import 'package:zero_balance/model/expense.dart';
//
// class ExpenseService {
//   static LocalStorage storage = LocalStorage('expense');
//   var stopwatch = Stopwatch()..start();
//
//   Future<ExpenseItem?> getExpenseFromCache() async {
//     await storage.ready;
//     Map<String, dynamic> data = storage.getItem('expense');
//     if (data == null) {
//       return null;
//     }
//     ExpenseItem expense = ExpenseItem.fromJson(data);
//     return expense;
//   }
//
//   void saveExpense(ExpenseItem expense) async {
//     await storage.ready;
//     storage.setItem("expense", expense);
//   }
// }
