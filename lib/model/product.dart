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
  double? off;
  bool favorite = false;
}
