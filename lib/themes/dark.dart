import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  backgroundColor: Color(0xff333333),
  scaffoldBackgroundColor: Color(0xff333333),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black12,
        width: 0.1,
      ),
      borderRadius: BorderRadius.circular(4),
    ),
    labelStyle: TextStyle(
      color: Colors.black38,
      fontSize: 20,
    ),
    constraints: BoxConstraints(
      minHeight: 40,
      maxHeight: 60,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(double.infinity, 40)),
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color(0xff333333),
    elevation: 1,
    selectedIconTheme: IconThemeData(
      color: Colors.blue,
      size: 28,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black54,
      size: 28,
    ),
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xff333333),
  ),
  dividerTheme: DividerThemeData(
    color: Colors.black26,
    thickness: 1,
  ),
  dividerColor: Colors.white,
);
