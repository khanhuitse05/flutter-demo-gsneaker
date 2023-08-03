part of 'cart_cubit.dart';

class CartState {
  final List<Shoes> data;
  const CartState({this.data = const []});

  bool isOnOf(int id) {
    return data.where((e) => e.id == id).isNotEmpty;
  }

  double get totalPrice {
    double value = 0;
    for (final e in data) {
      value += (e.price * e.count);
    }
    return value;
  }

  String get totalPriceText {
    return totalPrice <= 0.0
        ? "\$0.00"
        : "\$${double.parse(totalPrice.toStringAsFixed(2))}";
  }

  CartState copyWith({
    List<Shoes>? data,
  }) {
    return CartState(
      data: data ?? this.data,
    );
  }
}
