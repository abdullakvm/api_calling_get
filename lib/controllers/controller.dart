import 'package:apicallingget/core/network/api.dart';
import 'package:apicallingget/models/response.dart';
import 'package:get/get.dart';


class ShopController extends GetxController {
  var products = <ShopItem>[].obs;
  ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      List<ShopItem> fetchedProducts = await apiProvider.fetchProducts();
      products.assignAll(fetchedProducts);
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}