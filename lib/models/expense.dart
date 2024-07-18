import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';


const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, entertainment, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.motorcycle,
  Category.entertainment: Icons.tv,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class BucketExpense {
  final Category category;
  final List<Expense> expenses;

  BucketExpense({required this.category, required this.expenses});

  BucketExpense.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
