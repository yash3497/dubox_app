// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/utils/constant.dart';
import 'package:dubox_app/widgets/dashboard_banner.dart';
import 'package:dubox_app/widgets/dashboard_category_widget.dart';
import 'package:dubox_app/widgets/dashboard_item.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';

import '../../widgets/dashboard_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardBannerWidget(),
            HeightBox(20),
            DashboardCategoryScreen(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
            ),
            ListView.separated(
              itemCount: allItemList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DashBoardItem(
                  title: allItemList[index]['title'],
                  items: allItemList[index]['item'],
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
