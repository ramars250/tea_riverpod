class CartModel {
  final String teaTitle;
  final String cupType;
  final String iceLevel;
  final String sweetLevel;
  final List<String>? feeds;
  final String? customerName;
  final int totalPrice;

  CartModel({
    required this.teaTitle,
    required this.cupType,
    required this.iceLevel,
    required this.sweetLevel,
    this.feeds,
    this.customerName,
    required this.totalPrice,
  });
}

class Cart {
  List<CartModel> items = [];

  void addItem({
    required String teaTitle,
    required String cupType,
    required String iceLevel,
    required String sweetLevel,
    List<String>? feeds,
    String? customerName,
    required int totalPrice,
  }) {
    final item = CartModel(
      teaTitle: teaTitle,
      cupType: cupType,
      iceLevel: iceLevel,
      sweetLevel: sweetLevel,
      feeds: feeds,
      customerName: customerName,
      totalPrice: totalPrice,
    );
    items.add(item);
  }

  final cart = Cart();
}
