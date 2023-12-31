import 'package:bmi_calculator/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'B.M.I. CALCULATOR ',
            style: GoogleFonts.lato(),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: MainScreen(),
        ),
      ),
    );
  }
}
