import 'package:flutter/material.dart';

import '../utils/colors.dart';

PreferredSize DashboardAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight + 46.0),
    child: AppBar(
      backgroundColor: AppColors.appBarColor,
      title: Image.asset(
        "assets/icons/logo.png",
        height: 30,
        fit: BoxFit.cover,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_2_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
      flexibleSpace: Column(
        children: [
          SizedBox(height: kToolbarHeight),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.only(left: 20),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
