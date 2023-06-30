// ignore_for_file: prefer_const_constructors

import 'package:dubox_app/services/local_storage.dart';
import 'package:dubox_app/utils/colors.dart';
import 'package:dubox_app/utils/keys.dart';
import 'package:dubox_app/widgets/widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  bool isHome = true;
  bool isOffice = false;
  bool isOther = false;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final localityController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final landmarkController = TextEditingController();

  _addAddress() async {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        pincodeController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        localityController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty) {
      String type = isHome
          ? "Home"
          : isOffice
              ? "Office"
              : "Other";
      String address =
          "$type, ${nameController.text}, ${phoneController.text}, ${addressController.text}, ${localityController.text}, ${cityController.text}, ${landmarkController.text ?? ""}, ${stateController.text}, ${pincodeController.text}";
      LocalStorage.save(DbKeys.address, address);
      Get.back();
    } else {
      Get.showSnackbar(GetBar(
        message: "Please fill all the fields",
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //create a add address form
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(10),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Enter your phone number",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: pincodeController,
                      decoration: InputDecoration(
                        labelText: "Pincode",
                        hintText: "Enter your pincode",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: stateController,
                      decoration: InputDecoration(
                        labelText: "State",
                        hintText: "Enter your state",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              HeightBox(10),
              TextFormField(
                controller: localityController,
                decoration: InputDecoration(
                  labelText: "Locality",
                  hintText: "Enter your locality",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  hintText: "Enter your address",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(10),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City/District/Town",
                  hintText: "Enter your city/district/town",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(10),

              TextFormField(
                controller: landmarkController,
                decoration: InputDecoration(
                  labelText: "Landmark (Optional)",
                  hintText: "Enter your landmark",
                  border: OutlineInputBorder(),
                ),
              ),
              HeightBox(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isHome = !isHome;
                        });
                        if (isHome) {
                          isOffice = false;
                          isOther = false;
                        }
                      },
                      child: AddressTypeCard(
                          isSelected: isHome,
                          name: "Home",
                          icon: Icons.home_outlined),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOffice = !isOffice;
                        });
                        if (isOffice) {
                          isHome = false;
                          isOther = false;
                        }
                      },
                      child: AddressTypeCard(
                          isSelected: isOffice,
                          name: "Office",
                          icon: Icons.work_outline),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOther = !isOther;
                        });
                        if (isOther) {
                          isOffice = false;
                          isHome = false;
                        }
                      },
                      child: AddressTypeCard(
                          isSelected: isOther,
                          name: "Other",
                          icon: Icons.other_houses_outlined),
                    ),
                  ],
                ),
              ),
              HeightBox(20),
              ElevatedButton(
                onPressed: () {
                  _addAddress();
                },
                child: Text(
                  "Save Address",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//make address type card class

class AddressTypeCard extends StatelessWidget {
  final bool isSelected;
  final String name;
  final IconData icon;
  const AddressTypeCard(
      {super.key,
      required this.isSelected,
      required this.name,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            color: Colors.grey,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0).copyWith(left: 10, right: 10),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            WidthBox(10),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
