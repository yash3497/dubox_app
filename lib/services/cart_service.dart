import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartService extends GetxController {
  Map cartMap = {};
  static var box = GetStorage();

  Future<bool> addItem(Map item) async {
    cartMap = box.read("cartMap") ?? {};
    int quantity = cartMap[item['id'].toString()] != null
        ? cartMap[item['id'].toString()]['quantity'] ?? 0
        : 0;
    cartMap[item['id'].toString()] = {
      "quantity": quantity + 1,
      ...item,
    };
    await box.write("cartMap", cartMap);
    update();
    return true;
  }

  Future<int> removeItem(Map item) async {
    cartMap = await box.read("cartMap");
    int quantity = cartMap[item['id'].toString()] != null
        ? cartMap[item['id'].toString()]['quantity'] ?? 0
        : 0;
    if (quantity == 1) {
      cartMap.remove(item['id'].toString());
    } else {
      cartMap[item['id'].toString()] = {
        "quantity": quantity - 1,
        ...item,
      };
    }
    await box.write("cartMap", cartMap);
    update();
    return quantity - 1;
  }

  Future<bool> addCartItem(Map item) async {
    cartMap = box.read("cartMap") ?? {};
    cartMap[item['id'].toString()] = item;
    await box.write("cartMap", cartMap);
    update();
    return true;
  }

  Future<int> removeCartItem(Map item) async {
    cartMap = await box.read("cartMap");
    if (item['quantity'] == 0) {
      cartMap.remove(item['id'].toString());
    } else {
      cartMap[item['id'].toString()] = item;
    }
    await box.write("cartMap", cartMap);
    update();
    return item['quantity'];
  }

  Map fetchItem() {
    cartMap = box.read("cartMap");
    update();
    return cartMap;
  }

  clearCart() async {
    cartMap.clear();
    await box.remove("cartMap");
    update();
  }
}
