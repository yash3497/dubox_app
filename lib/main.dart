import 'package:dubox_app/screens/dashboard/dashboard.dart';
import 'package:dubox_app/screens/splash.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dubox",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      // home: SplashScreen(),
      home: DashboardScreen(),
    );
  }
}
