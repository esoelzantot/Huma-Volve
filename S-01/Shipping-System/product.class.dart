abstract class Product {
  String id;
  String name;
  double basePrice;

  Product(this.id, this.name, this.basePrice);

  double calcFinalPrice();
}
