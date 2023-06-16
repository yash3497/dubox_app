// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/dashboard_item_card.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../screens/category/category_item_screen.dart';

class DashBoardItem extends StatelessWidget {
  final String title;
  final List items;
  const DashBoardItem({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(() => CategoryItemScreen(categoryName: title),
                          transition: Transition.rightToLeft);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          HeightBox(10),
          SizedBox(
            height: 270,
            child: ListView.separated(
              itemCount: items.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return DashboardItemCard(
                  item: items[index],
                  category: title,
                );
              },
              separatorBuilder: (context, index) {
                return WidthBox(10);
              },
            ),
          ),
        ],
      ),
    );
  }
}
