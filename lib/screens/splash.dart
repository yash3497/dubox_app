import 'dart:async';

import 'package:dubox_app/screens/dashboard/dashboard.dart';
import 'package:dubox_app/services/local_storage.dart';
import 'package:dubox_app/utils/keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {
      if (await LocalStorage.read(DbKeys.userId) != null) {
        Get.offAll(DashboardScreen());
      } else {
        Get.offAll(LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/icons/logo.png")),
    );
  }
}
