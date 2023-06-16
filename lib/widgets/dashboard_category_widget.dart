// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dubox_app/utils/constant.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../screens/category/category_item_screen.dart';

class DashboardCategoryScreen extends StatefulWidget {
  const DashboardCategoryScreen({super.key});

  @override
  State<DashboardCategoryScreen> createState() =>
      _DashboardCategoryScreenState();
}

class _DashboardCategoryScreenState extends State<DashboardCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          HeightBox(10),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              var e = categoryList[index];
              return InkWell(
                onTap: () {
                  Get.to(
                      () => CategoryItemScreen(
                            categoryName: e["name"],
                          ),
                      transition: Transition.zoom);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          e["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    HeightBox(10),
                    Center(
                      child: Text(
                        e["name"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
