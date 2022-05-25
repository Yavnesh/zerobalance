import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:zero_balance/db/database_provider.dart';
import 'package:zero_balance/model/expense.dart';

class AddExpenseScreen extends StatefulWidget {
  final Expense? expense;
  const AddExpenseScreen({Key? key, this.expense}) : super(key: key);

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _merchantController = TextEditingController();

  final _expenseCategory = ['Food', 'Entertainment', 'Shopping'];
  var _expenseCategoryItemSelected = 'Food';

  final _payment = [
    'GPay',
    'Paytm',
    'Cash',
    'Credit Card',
    'Debit Card',
    'Others'
  ];
  var _paymentItemSelected = 'GPay';

  String date = "";
  DateTime selectedDate = DateTime.now();

  _addItem() {
    final Expense expense = Expense(
      amount: _amountController.text,
      merchant: _merchantController.text,
      expenseCategoryType: _expenseCategoryItemSelected,
      paymentType: _paymentItemSelected,
      date: selectedDate.toString(),
    );
    DatabaseProvider.addDatabase(expense);

    Toast.show("Expense Saved Successfully!!", duration: Toast.lengthShort, gravity: Toast.bottom,
        backgroundColor: Colors.black, textStyle: const TextStyle(color: Colors.white));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Add expense",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Record your expensesfor them to \nreflectin your categories",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Container(
                  color: const Color(0xff272729),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 12.0, top: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Amount",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .45,
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  color: const Color(0xff272729),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 12.0, top: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Category",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Colors.black,
                          isExpanded: false,
                          underline: const SizedBox(),
                          items: _expenseCategory.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String? newValueSelected) {
                            setState(() {
                              _expenseCategoryItemSelected = newValueSelected!;
                            });
                          },

                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          // icon: Icon(Icons.arrow_drop_down, color: Colors.white,),
                          // iconSize: 36,
                          value: _expenseCategoryItemSelected,
                        ),
                        // Text(
                        //   "Food",
                        //   style: TextStyle(
                        //       fontSize: 24.0,
                        //       fontWeight: FontWeight.w600,
                        //       color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  color: const Color(0xff272729),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 12.0, top: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: IntrinsicWidth(
                            child: Text(
                              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  color: const Color(0xff272729),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 12.0, top: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Merchant",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .45,
                          child: TextField(
                            controller: _merchantController,
                            style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  color: const Color(0xff272729),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 12.0, top: 14.0, bottom: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Paid via",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Colors.black,
                          isExpanded: false,
                          underline: const SizedBox(),
                          items: _payment.map((String dropDownStringItem) {
                            return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem),
                            );
                          }).toList(),
                          onChanged: (String? newValueSelected) {
                            setState(() {
                              _paymentItemSelected = newValueSelected!;
                            });
                          },
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                          value: _paymentItemSelected,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                _addItem();
              },
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 21.0),
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
