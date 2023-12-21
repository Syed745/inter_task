import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
