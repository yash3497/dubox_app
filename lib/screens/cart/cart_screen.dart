// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:dubox_app/services/cart_service.dart';
import 'package:dubox_app/services/local_storage.dart';
import 'package:dubox_app/services/order_service.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/utils/keys.dart';
import 'package:dubox_app/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'coupoun_screen.dart';
import 'delivery_address_screen.dart';
import 'order_confirm_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String address = "";
  int subtotal = 0;
  int deliveryCharge = 100;
  double discount = 0;
  double total = 0;
  List itemsList = [];

  _fetchAddress() async {
    address = await LocalStorage.read(DbKeys.address);
    setState(() {});
  }

  _calculationTotal() {
    total = subtotal + deliveryCharge - discount;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAddress();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          color: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: ₹ $total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Map data = {
                    "total": total,
                    "items": itemsList,
                  };

                  await OrderService().addOrders(data);
                  await CartService().clearCart();

                  Get.to(() => OrderConfirmScreen());
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: AppColors.appBarColor,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<CartService>(
              init: CartService(),
              builder: (c) {
                Map data = c.cartMap ?? {};
                subtotal = 0;
                if (c.cartMap != null && c.cartMap != {}) {
                  data.entries.forEach(
                    (element) {
                      subtotal += int.parse(element.value['price'].toString()) *
                          int.parse(element.value['quantity'].toString());
                      itemsList.add(element.value);
                    },
                  );
                  _calculationTotal();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.separated(
                      itemCount: c.cartMap != null && c.cartMap != {}
                          ? c.cartMap.entries.length
                          : 0,
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          data: c.cartMap.entries.elementAt(index).value,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: Colors.grey[300],
                      thickness: 2,
                    ),
                    //delivery address
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => DeliveryAddressScreen())
                                  ?.then((value) => _fetchAddress());
                            },
                            child: Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10).copyWith(top: 5),
                      child: Text(
                        address != "" && address != null
                            ? address
                            : "No Address Found!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => CoupounPage())?.then((value) {
                            if (value != null) {
                              if (subtotal >= value["minCartValue"]) {
                                setState(() {
                                  discount = (subtotal *
                                          int.parse(
                                              value['discount'].toString())) /
                                      100;
                                  _calculationTotal();
                                });
                              } else {
                                Get.snackbar(
                                    "Not Applied!", "Please Add More Items");
                              }
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              "Apply Coupon",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                    ),
                    //payment structure
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Payment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10)
                          .copyWith(top: 10, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "₹ $subtotal",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charge",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "₹ $deliveryCharge",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discount",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "₹ $discount",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "₹ $total",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
