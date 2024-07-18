import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 18, 24, 44));
var darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(136, 3, 41, 17));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: GoogleFonts.oswald(
                fontSize: 16,
                color: darkColorScheme.onSecondaryContainer,
              ),
            ),
        colorScheme: darkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.primaryContainer,
            foregroundColor: darkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: GoogleFonts.oswald(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colorScheme.onSecondaryContainer,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
