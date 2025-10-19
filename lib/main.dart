import 'package:flutter/material.dart';
import 'package:sewa_lapangan/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sewa Lapangan App',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}