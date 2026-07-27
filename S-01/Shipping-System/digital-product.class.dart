import 'product.class.dart';

class DigitalProduct extends Product {
  String downloadUrl;
  double fileSizeInMB;

  DigitalProduct(
    String id,
    String name,
    double basePrice,
    this.downloadUrl,
    this.fileSizeInMB,
  ) : super(id, name, basePrice);

  @override
  double calcFinalPrice() {
    // TODO: implement calcFinalPrice
    throw UnimplementedError();
  }
}
