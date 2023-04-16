import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tea_riverpod/model/cart_model.dart';

class OrderViewModel extends StateNotifier<List<CartModel>> {
  OrderViewModel() : super([]);

  void addToCart(CartModel item) {
    state = [...state, item];
  }

  void removeFromCart(CartModel item) {
    state = List.of(state)..remove(item);
  }

  int get allPrice {
    return state.fold(0, (total, item) => total + item.totalPrice);
  }
}
