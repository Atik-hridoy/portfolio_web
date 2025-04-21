import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart'; // Make sure this is correct
import 'screens/projects_screen.dart';

void main() {
  runApp(const AtikPortfolioApp());
}

class AtikPortfolioApp extends StatelessWidget {
  const AtikPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atik Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Courier',
        scaffoldBackgroundColor: const Color(0xFF0F111A),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/projects': (context) => const ProjectScreen(),
      },
    );
  }
}
