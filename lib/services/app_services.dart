import 'dart:math';

class AppService {
  static Future<String> randomOrderIdGenerator() async {
    const int orderIDLength = 10;
    final Random random = Random();

    String orderID = '';
    for (int i = 0; i < orderIDLength; i++) {
      int randomDigit = random.nextInt(10);
      orderID += randomDigit.toString();
    }

    return '$orderID';
  }
}
