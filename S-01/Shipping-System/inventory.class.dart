class Inventory<Product> {
  String name;
  List<Product> products = [];

  Inventory(this.name, this.products);

  void addProduct(Product product) {
    products.add(product);
  }

  void removeProduct(Product product) {
    products.remove(product);
  }
}
