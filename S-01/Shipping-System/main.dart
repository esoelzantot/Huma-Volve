import 'creditCard-payment.class.dart';
import 'customer.class.dart';
import 'delivery-agent.class.dart';
import 'digital-product.class.dart';
import 'inventory.class.dart';
import 'order.class.dart';
import 'physical-product.class.dart';
import 'product.class.dart';

void main() {
  // ===== Physical Products =====
  Product product1 = PhysicalProduct("1101", "Laptop", 15000, 1000, 4);
  Product product2 = PhysicalProduct("1102", "Mobile", 9000, 50, 3.5);
  // ===== Digital Products =====
  Product product3 = DigitalProduct(
    "1103",
    "Book",
    500,
    "https://bytes.usc.edu/~saty/courses/docs/data/SystemDesignInterview.pdf",
    4.5,
  );
  // ===== INVENTORY =====
  Inventory inventory = Inventory("Inventory 1", [
    product1,
    product2,
    product3,
  ]);

  // ===== ORDER =====
  Order order = Order("Order 1");
  order.addItem(product1, 2);
  order.addItem(product2, 1);
  order.addItem(product3, 1);

  // ===== CUSTOMER =====
  Customer customer = Customer("Omar");
  customer.addOrder(order);
  customer.addPayment(CreditCardPayment());

  // ===== DELIVERY AGENT =====
  DeliveryAgent deliveryAgent = DeliveryAgent("Yusuf Elmasry");
  deliveryAgent.assignOrder(order);
  deliveryAgent.trackLocation();

  // ===== CHECKOUT =====
  order.checkout(CreditCardPayment());
}
