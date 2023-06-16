// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/utils/constant.dart';
import 'package:dubox_app/widgets/dashboard_item_card.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ItemDetailScreen extends StatefulWidget {
  final Map item;
  final String category;
  const ItemDetailScreen(
      {super.key, required this.item, required this.category});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  List similarItems = [];
  bool isadded = false;

  _fetchSimilarItem() async {
    List dummyList = [];
    dummyList = allItemList
        .where((element) => element['title'] == widget.category)
        .toList()[0]['item'];
    setState(() {
      similarItems = dummyList
          .where((element) => element['id'] != widget.item['id'])
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchSimilarItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.item['image'],
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.item['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.item['description'],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(top: 20),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.4),
                      ),
                      child: const Center(
                        child: Text(
                          "Hot Deal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "${widget.item['discount']}% OFF",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      WidthBox(10),
                      Text(
                        "₹${widget.item['originalPrice']}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      WidthBox(10),
                      Text(
                        "₹${widget.item['price']}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isadded = !isadded;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              isadded ? Colors.white : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                isadded ? AppColors.primaryColor : Colors.white,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            isadded ? "Go to Cart" : "Add to Cart",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isadded
                                  ? AppColors.primaryColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )),
                Container(
                  height: 4,
                  color: Colors.grey.withOpacity(.2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      _showProductDetailBottomSheet();
                    },
                    child: Row(
                      children: [
                        Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 4,
                  color: Colors.grey.withOpacity(.2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10)
                      .copyWith(top: 10),
                  child: const Text(
                    "Similar Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 300,
                    child: ListView.separated(
                      itemCount: similarItems.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DashboardItemCard(
                          item: similarItems[index],
                          category: widget.category,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return WidthBox(10);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 40,
              left: 20,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios))),
        ],
      ),
    );
  }

  //create bottom sheet show product details
  _showProductDetailBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                HeightBox(15),
                Row(
                  children: [
                    Text(
                      "Brand Name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "US Polo",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Black",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "M",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Text(
                      "Material",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Cotton",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
