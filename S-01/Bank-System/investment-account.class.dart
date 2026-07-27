import 'bank-account.class.dart';
import 'risk.enum.dart';

class InvestmentAccount extends BankAccount {
  Risk risk;

  InvestmentAccount(
    int accountNumber,
    String holderName,
    double balance,
    int pin,
    this.risk,
  ) : super(accountNumber, holderName, balance, pin);
  @override
  double interest(double rate) {
    // TODO: implement interest
    double interest = 0.0;
    switch (risk) {
      case Risk.LOW:
        interest = this.balance * (rate / 100);
        break;
      case Risk.MEDIUM:
        interest = this.balance * (rate / 100) * 2;
        break;
      case Risk.HIGH:
        interest = this.balance * (rate / 100) * 3;
        break;
    }
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
    if (amount > this.balance) {
      print("Insufficient balance");
      return;
    }

    this.balance -= amount;
  }
}
