// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/screens/dashboard/dashboard.dart';
import 'package:dubox_app/services/login_service.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenoController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width),
          decoration: BoxDecoration(color: AppColors.appBarColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0)
                    .copyWith(top: 140),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign-up",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    HeightBox(20),
                    Text(
                      "Welcome to Duboxx ",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: nameController,
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
                        controller: emailController,
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
                        controller: phonenoController,
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
                        controller: passwordController,
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
                      HeightBox(50),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          ),
                          onPressed: () async {
                            if (nameController.text.isEmpty) {
                              Get.snackbar("Error", "Please enter your name",
                                  backgroundColor: Colors.red);
                              return;
                            }
                            if (emailController.text.isEmpty) {
                              Get.snackbar("Error", "Please enter your email",
                                  backgroundColor: Colors.red);
                              return;
                            }
                            if (phonenoController.text.isEmpty) {
                              Get.snackbar(
                                  "Error", "Please enter your phone number",
                                  backgroundColor: Colors.red);
                              return;
                            }
                            if (passwordController.text.isEmpty) {
                              Get.snackbar(
                                  "Error", "Please enter your password",
                                  backgroundColor: Colors.red);
                              return;
                            }
                            if (await LoginService().login(emailController.text,
                                passwordController.text)) {
                              Get.offAll(() => DashboardScreen());
                            } else {
                              Get.snackbar("Error", "Invalid credentials",
                                  backgroundColor: Colors.red);
                            }
                          },
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
