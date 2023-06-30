// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/screens/dashboard/dashboard.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Order Confirmed"),
        backgroundColor: AppColors.appBarColor,
        leading: InkWell(
            onTap: () {
              Get.offAll(() => DashboardScreen());
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset("assets/icons/confirm.gif"),
            SizedBox(height: 20),
            Text(
              "Your order has been confirmed",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightBox(20),
            Text(
              "Your order will be delivered within 2-3 days",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            HeightBox(20),
            Text(
              "Thank you for shopping with us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
