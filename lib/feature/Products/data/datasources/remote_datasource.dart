import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_api_reponse.dart';
import 'package:poynt_hackathon/feature/Products/data/models/product_model.dart';

abstract interface class ProductRemoteDataSource {
  Future<List<PYProductModel>> getProducts();
  Future<List<String>> getCategories();
}

final class DioProductRemoteDataSource implements ProductRemoteDataSource {
  final Dio _api;

  DioProductRemoteDataSource({required Dio api}) : _api = api;
  @override
  Future<List<PYProductModel>> getProducts() async {
    try {
      final res = await _api.get<ProductApiResponse>("/v1/products");
      if (res.statusCode == 200) {
        if (res.data != null) {
          print(res.data!.data);
          return res.data!.data;
        } else {
          throw ErrorDescription("unable to parse data");
        }
      } else {
        throw ErrorDescription("unable to get product");
      }
    } catch (e) {
      throw ErrorDescription("Something went wrong${e.toString()}");
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final resp = await _api.get("/v1/categories");

      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.data) as List<Map<String, dynamic>>;
        final cats = json.map((el) => el["name"] as String).toList();
        return cats;
      } else {
        throw ErrorDescription("unable to get categories");
      }
    } catch (e) {
      throw ErrorDescription("Something went wrong${e.toString()}");
    }
  }
}
