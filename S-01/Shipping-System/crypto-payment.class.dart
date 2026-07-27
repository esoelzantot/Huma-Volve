import 'payment-processor.interface.dart';

class CryptoPayment implements IPaymentProcessor {
  @override
  bool processPayment(double amount) {
    // TODO: implement processPayment
    print("Processing crypto payment of $amount");
    return true;
  }
}
