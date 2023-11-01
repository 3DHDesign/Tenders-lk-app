import 'package:flutter/material.dart';
import 'package:tenders_lk_app/screens/home/HomeScreen.dart';
import 'package:tenders_lk_app/screens/login/loginScreen.dart';
import 'package:tenders_lk_app/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/intro': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
