class Product {
  Product({
    required this.name,
    required this.price,
    required this.imageAddress,
    this.off,
  });

  String name;
  int price;
  String imageAddress;
  int? off;
  bool favorite = false;

  int? priceByOff() {
    if (off == null) return null;
    double discount = price * (off! / 100.0);
    return price - discount.toInt();
  }
}
