import 'package:flutter/material.dart';
import 'package:kriptonalisis/ui/theme.dart';

import 'feature/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kriptonalisis',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}

