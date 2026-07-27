import 'product.class.dart';
import 'trackable.mixin.dart';
import 'discountable.mixin.dart';

class PhysicalProduct extends Product with Trackable, Discountable {
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
    double shippingCost = weightInKg * shippingRatePerKg;
    double priceBeforeDiscount = basePrice + shippingCost;
    return applyDiscount(priceBeforeDiscount);
  }
}
