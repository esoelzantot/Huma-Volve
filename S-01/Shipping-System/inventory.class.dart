import 'product.class.dart';

class Inventory<T> {
  List<Product> products = [];

  Inventory(this.products);

  void addProduct(Product product) {
    products.add(product);
  }

  void removeProduct(Product product) {
    products.remove(product);
  }
}
