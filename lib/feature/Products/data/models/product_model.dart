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
