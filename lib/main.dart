import 'package:flutter/material.dart';
import 'package:search_products/view/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf7f2ff),
        primarySwatch: Colors.blue,
      ),
      home: const SearchScreen(),
    );
  }
}

