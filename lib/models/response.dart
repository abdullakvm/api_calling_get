

class ShopItem {
  int id;
  String title;
  double price;

  Rating rating;

  ShopItem({
    required this.id,
    required this.title,
    required this.price,
    required this.rating,
  });
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });
}
