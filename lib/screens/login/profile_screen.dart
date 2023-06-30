// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //create edit profile form
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXZhdGFyfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HeightBox(50),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: "Name",
                hintStyle: GoogleFonts.montserrat(),
                prefixIcon: Icon(
                  Icons.account_box_rounded,
                  color: Colors.grey[600],
                ),
              ),
            ),
            HeightBox(20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: "E-mail",
                hintStyle: GoogleFonts.montserrat(),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey[600],
                ),
              ),
            ),
            HeightBox(20),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: "Phone number",
                hintStyle: GoogleFonts.montserrat(),
                prefixIcon: Icon(
                  Icons.add_ic_call,
                  color: Colors.grey[600],
                ),
              ),
            ),
            HeightBox(20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFe7edeb),
                hintText: "Password",
                hintStyle: GoogleFonts.montserrat(),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
