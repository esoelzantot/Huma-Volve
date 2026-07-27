import 'product.class.dart';

class PhysicalProduct extends Product {
  double weightInKg;
  double shippingRatePerKg;

  PhysicalProduct(
    String id,
    String name,
    double basePrice,
    this.weightInKg,
    this.shippingRatePerKg,
  ) : super(id, name, basePrice);

  @override
  double calcFinalPrice() {
    // TODO: implement calcFinalPrice
    throw UnimplementedError();
  }
}
