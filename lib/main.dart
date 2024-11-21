import 'package:flutter/material.dart';
import 'package:praktekin/coba/listview.dart';
import 'package:praktekin/coba/searchbar.dart';
// import 'package:praktekin/main_screen.txt';
import 'package:praktekin/coba/test.dart';

import 'main_screen_copy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String appName = 'Praktekin';
  final bool isDark = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: isDark ? Colors.blue : Colors.black,
          unselectedItemColor: isDark ? Colors.white : Colors.black,
        ),
        useMaterial3: true,
      ),
      home:
      // SearchBarApp()
      MainScreenCopy(appName: appName,),
        //MainScreen(appName: appName),
    );
  }
}
