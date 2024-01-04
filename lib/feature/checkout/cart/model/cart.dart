import '../../../Products/data/models/product_model.dart';

class Cart {
  final PYProductModel product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

List<Cart> demoCart = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];
