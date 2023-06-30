import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/my_order_card.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: AppColors.appBarColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MyOrderCard();
        },
      ),
    );
  }
}
