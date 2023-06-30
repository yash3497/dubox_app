// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/utils/constant.dart';
import 'package:flutter/material.dart';

class CoupounPage extends StatelessWidget {
  const CoupounPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coupon"),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: couponList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  couponList[index]["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  couponList[index]["description"],
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "discount": couponList[index]["discount"],
                      "minCartValue": couponList[index]["minCartValue"],
                    });
                  },
                  child: Text("Apply"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
