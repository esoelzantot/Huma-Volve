import 'payment-processor.interface.dart';
import 'product.class.dart';

class Order {
  String id;
  List<OrderItem> items = [];
  Invoice? invoice;

  Order(this.id);

  void addItem(Product product, int quantity) {
    items.add(OrderItem(product, quantity));
  }

  void checkout(IPaymentProcessor payment) {
    double total = 0.0;
    for (var item in items) {
      total += item.product.calcFinalPrice() * item.quantity;
    }
    invoice = Invoice(total, "USD");
    payment.processPayment(total);
  }
}

class Invoice {
  double amount = 0.0;
  String currency = "USD";

  Invoice(this.amount, this.currency);
}

class OrderItem {
  Product product;
  int quantity;

  OrderItem(this.product, this.quantity);
}
