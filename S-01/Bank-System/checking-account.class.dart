import 'bank-account.class.dart';

class CheckingAccount extends BankAccount {
  double _overdraftLimit = 0.0;

  CheckingAccount(int accountNumber, String holderName, double balance, int pin)
    : super(accountNumber, holderName, balance, pin);

  get overdraftLimit => _overdraftLimit;
  set overdraftLimit(double value) => _overdraftLimit = value;

  @override
  double interest(double rate) {
    // TODO: implement interest
    final interest = this.balance * (rate / 100);
    return interest;
  }

  @override
  void withdraw(int pin, double amount) {
    // TODO: implement withdraw
    if (pin != this.pin) {
      print("Incorrect PIN");
      return;
    }
    if (amount <= 0) {
      print("Cannot withdraw negative amount");
      return;
    }
    if (amount > this.balance + _overdraftLimit) {
      print("Insufficient balance");
      return;
    }
    this.balance -= amount;
  }
}
