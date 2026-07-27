import 'order.class.dart';
import 'payment-processor.interface.dart';

class Customer {
  String name;
  List<Order> orders = [];
  List<IPaymentProcessor> payments = [];

  void addOrder(Order order) => orders.add(order);

  void addPayment(IPaymentProcessor payment) => payments.add(payment);

  Customer(this.name);
}
