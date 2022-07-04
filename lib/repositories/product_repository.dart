import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:app/model/shoes.dart';

abstract class ProductRepository {
  Future<List<Shoes>> fetchProduct();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Shoes>> fetchProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    final String response = await rootBundle.loadString('assets/shoes.json');
    final json = jsonDecode(response);
    final List<Shoes> shoes = [];
    json['shoes'].forEach((v) {
      shoes.add(Shoes.fromJson(v));
    });
    return shoes;
  }
}
