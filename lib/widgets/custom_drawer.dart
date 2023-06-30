// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dubox_app/screens/drawer/my_order_screen.dart';
import 'package:dubox_app/screens/login/login_screen.dart';
import 'package:dubox_app/screens/login/profile_screen.dart';
import 'package:dubox_app/services/local_storage.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: AppColors.appBarColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXZhdGFyfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60'),
                ),
                HeightBox(10),
                Text(
                  "Yash Gupta",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          // add my order
          ListTile(
            onTap: () {
              Get.to(() => MyOrderScreen());
            },
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text(
              "My Orders",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          // add edit profile
          ListTile(
            onTap: () {
              Get.to(() => EditProfileScreen());
            },
            leading: Icon(Icons.person_outline),
            title: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          //add logout
          ListTile(
            onTap: () {
              LocalStorage.remove();
              Get.offAll(() => LoginScreen());
            },
            leading: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
