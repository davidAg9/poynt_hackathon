import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class PYProductModel with _$PYProductModel {
  const factory PYProductModel({
    required String id,
    required String name,
    required String imgUrl,
    required double price,
    required String category,
    required List<String> tags,
  }) = _PYProductModel;

  factory PYProductModel.fromJson(Map<String, dynamic> json) => _$PYProductModelFromJson(json);
}

List<PYProductModel> demoProducts = const [
  PYProductModel(
    id: "1",
    name: "Wireless Controller for PS4™",
    imgUrl: "assets/images/ps4_console_white_1.png",
    price: 64.99,
    category: "Gaming",
    tags: ["ps4", "controller", "gaming"],
  ),
  PYProductModel(
    id: "1",
    name: "Wireless Controller for PS4™",
    imgUrl: "assets/images/ps4_console_white_1.png",
    price: 64.99,
    category: "Gaming",
    tags: ["ps4", "controller", "gaming"],
  ),
  PYProductModel(
    id: "1",
    name: "Wireless Controller for PS4™",
    imgUrl: "assets/images/ps4_console_white_1.png",
    price: 64.99,
    category: "Gaming",
    tags: ["ps4", "controller", "gaming"],
  ),
  PYProductModel(
    id: "1",
    name: "Wireless Controller for PS4™",
    imgUrl: "assets/images/ps4_console_white_1.png",
    price: 64.99,
    category: "Gaming",
    tags: ["ps4", "controller", "gaming"],
  ),
];
