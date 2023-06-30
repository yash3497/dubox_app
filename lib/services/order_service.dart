import 'dart:developer';

import 'package:dubox_app/services/app_services.dart';
import 'package:dubox_app/services/local_storage.dart';
import 'package:dubox_app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderService extends GetxController {
  List orderData = [];
  static var box = GetStorage();

  addOrders(Map data) async {
    try {
      String orderId = await AppService.randomOrderIdGenerator();
      Map order = {
        "orderId": orderId,
        "orderDate": DateTime.now().millisecondsSinceEpoch.toString(),
        "deliveryDate": "-",
        "deliveryAddress": await LocalStorage.read(DbKeys.address),
        "status": "Placed",
        "total": data['total'],
        "mode": "COD",
        "items": data['items'],
      };
      orderData.add(order);
      await box.write(DbKeys.order, orderData);
      update();
    } catch (e) {
      log("order placed error: $e");
    }
  }
}
