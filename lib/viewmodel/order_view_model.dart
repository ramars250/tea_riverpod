import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderViewModel extends StateNotifier<Map<int, Map<String, String>>> {
  OrderViewModel() : super({});

  void addToCart(int orderId, Map<String, String> options) {
    state[orderId] = options;
  }

  void totelPrice() {

  }
}
