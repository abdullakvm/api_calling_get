import 'dart:convert';
import 'package:apicallingget/models/response.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<List<ShopItem>> fetchProducts() async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<ShopItem> fetchedProducts = jsonResponse.map((json) {
          return ShopItem(
            id: json['id'],
            title: json['title'],
            price: json['price'].toDouble(),
            rating: Rating(
              rate: json['rating']['rate'].toDouble(),
              count: json['rating']['count'],
            ),
          );
        }).toList();

        return fetchedProducts;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
