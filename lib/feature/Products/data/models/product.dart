final class PYProduct with _$PYProduct {
  const factory PYProduct({
    required String id,
    required String name,
    required String imgUrl,
    required double price,
    required String category,
    required List<String> tags,
  }) = _PYProduct;

  factory PYProduct.fromJson(Map<String, dynamic> json) => _$PYProductFromJson(json);
}
