import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Може да додадете дополнителни теми по ваш избор
      ),
      home: HomeScreen(),
      routes: {
        '/detail': (ctx) => DetailScreen(),
      },
    );
  }
}