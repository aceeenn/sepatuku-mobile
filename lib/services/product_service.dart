import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sepatuku/models/product_model.dart';

class ProductService {
  String baseUrl = 'http://10.0.2.2:8000/api';
  // String baseUrl = 'http://192.168.101.7:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal get products!');
    }
  }
}
