import 'payment-processor.interface.dart';

class CreditCardPayment implements IPaymentProcessor {
  @override
  bool processPayment(double amount) {
    // TODO: implement processPayment
    print("Processing credit card payment of $amount");
    return true;
  }
}
