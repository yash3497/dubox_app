import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/utils/constant.dart';
import 'package:dubox_app/widgets/dashboard_item_card.dart';
import 'package:flutter/material.dart';

class CategoryItemScreen extends StatelessWidget {
  final String categoryName;
  const CategoryItemScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    List items = allItemList
        .where((element) => element['title'] == categoryName)
        .toList()[0]['item'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return DashboardItemCard(
              item: items[index],
              category: categoryName,
            );
          },
        ),
      ),
    );
  }
}
