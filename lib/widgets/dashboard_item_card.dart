// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/services/cart_service.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/category/item_detail_screen.dart';

class DashboardItemCard extends StatefulWidget {
  final Map item;
  final String category;
  const DashboardItemCard(
      {super.key, required this.item, required this.category});

  @override
  State<DashboardItemCard> createState() => _DashboardItemCardState();
}

class _DashboardItemCardState extends State<DashboardItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<CartService>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                      () => ItemDetailScreen(
                            item: widget.item,
                            category: widget.category,
                          ),
                      transition: Transition.downToUp);
                },
                child: Center(
                  child: Image.network(
                    widget.item['image'],
                    height: 150,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              HeightBox(10),
              Text(
                widget.item['name'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.item['description'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text("${widget.item['discount']}% OFF",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.appBarColor,
                  )),
              HeightBox(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "₹${widget.item['price']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  WidthBox(5),
                  Text(
                    "₹${widget.item['originalPrice']}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Spacer(),
                  controller.cartMap == null ||
                          controller.cartMap["${widget.item['id']}"] == null ||
                          controller.cartMap["${widget.item['id']}"]
                                  ['quantity'] ==
                              null ||
                          controller.cartMap["${widget.item['id']}"]
                                  ['quantity'] ==
                              0
                      ? InkWell(
                          onTap: () {
                            Get.put(CartService()).addItem(widget.item);
                          },
                          child: Container(
                            width: 40,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.appBarColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        )
                      : Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.put(CartService()).removeItem(widget.item);
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            WidthBox(5),
                            Text(
                              "${controller.cartMap["${widget.item['id']}"]['quantity']}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            WidthBox(5),
                            InkWell(
                              onTap: () {
                                Get.put(CartService()).addItem(widget.item);
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
