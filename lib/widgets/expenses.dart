import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _listOfExpenses = [];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (ctx) => NewExpense(
        onAddExpense: _addNewExpense,
      ),
    );
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _listOfExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _listOfExpenses.indexOf(expense);
    setState(() {
      _listOfExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(
          'Expense Deleted',
          style: GoogleFonts.oswald(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _listOfExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No Expense Added. Start Managing Your Expenses',
        style: GoogleFonts.oswald(),
      ),
    );

    if (_listOfExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _listOfExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Expense Mate',
          style: GoogleFonts.oswald(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _addExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _listOfExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _listOfExpenses)),
                Expanded(child: mainContent),
              ],
            ),
    );
  }
}
