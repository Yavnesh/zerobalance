import 'package:flutter/material.dart';

class Expense {
  final int? id;
  final String amount;
  final String merchant;
  final String expenseCategoryType;
  final String paymentType;
  final String date;

  const Expense({this.id, required this.amount, required this.merchant,
    required this.expenseCategoryType, required this.paymentType, required this.date});

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    id : json['id'],
    merchant : json['merchant'],
    amount : json['amount'],
    expenseCategoryType : json['expenseCategoryType'],
    paymentType : json['paymentType'],
    date : json['date'],
  );

  Map<String, dynamic> toJson() =>  {
    'id' : UniqueKey().hashCode,
    'merchant' : merchant,
    'amount' : amount,
    'expenseCategoryType' : expenseCategoryType,
    'paymentType' : paymentType,
    'date' : date,
  };
}

