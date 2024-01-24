import 'package:flutter/material.dart';

class AppTheme {
  
static ThemeData lightTheme = ThemeData(

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.light,
    
    ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
  ),
  textTheme: Typography.blackRedmond,
  iconTheme: const IconThemeData(color: Colors.black)


);
static ThemeData darkTheme = ThemeData(

  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.dark,
    
    ),
  scaffoldBackgroundColor: Colors.black87,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
  ),
  textTheme: Typography.whiteRedmond,
  iconTheme: const IconThemeData(color: Colors.white)


);

}