import 'dart:math';

import 'package:apicallingget/controllers/controller.dart';
import 'package:apicallingget/models/response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  final ShopController shopController = Get.put(ShopController());

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'PRODUCTS',
          style: TextStyle(
              color: Color.fromARGB(255, 1, 57, 103),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        )),
      ),
      body: Center(
        child: Obx(() => ListView.separated(
              itemCount: shopController.products.length,
              itemBuilder: (context, index) {
                ShopItem product = shopController.products[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: randomPastelColor(),
                    child: Text(product.id.toString()),
                  ),
                  title: Text(
                    product.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${product.price.toString()}',
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rating: ${product.rating.rate.toString()}',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            )),
      ),
    );
  }

  Color randomPastelColor() {
    final Random random = Random();

    // Generate random hue value between 0 and 360
    double hue = random.nextDouble() * 360;
    // Set saturation to a low value to get pastel colors
    double saturation = 0.4 + random.nextDouble() * 0.2;
    // Set value to a high value to ensure light colors
    double value = 0.8 + random.nextDouble() * 0.2;

    return HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
  }
}
