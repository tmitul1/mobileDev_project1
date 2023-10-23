import 'package:flutter/material.dart';

class ExpenseItem {
  final String category;
  final String amount;
  final Icon img;
  ExpenseItem(
      {required this.category, required this.amount, required this.img});
}
