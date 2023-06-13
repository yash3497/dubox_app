import 'package:dubox_app/screens/splash.dart';
import 'package:dubox_app/utils/colors.dart';
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
      title: "Dubox",
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      home: SplashScreen(),
    );
  }
}
