import 'bank-account.class.dart';

class SavingsAccount extends BankAccount {
  int noOfWithdrawals = 0;
  DateTime? lastWithdrawalDate;

  SavingsAccount(int accountNumber, String holderName, double balance, int pin)
    : super(accountNumber, holderName, balance, pin);

  @override
  void printInfo() {
    print("Account Type: Savings Account");
    super.printInfo();
  }

  @override
  double interest(double rate) {
    // TODO: implement interest
    double interest = this.balance * (rate / 100);
    return interest;
  }

  @override
  @override
  bool withdraw(int pin, double amount) {
    if (pin != this.pin) {
      print("Incorrect PIN");
      return false;
    }
    if (amount <= 0) {
      print("Cannot withdraw negative amount");
      return false;
    }
    if (amount > this.balance) {
      print("Insufficient balance");
      return false;
    }

    final now = DateTime.now();
    if (lastWithdrawalDate != null && _isNewMonth(lastWithdrawalDate!, now)) {
      noOfWithdrawals = 0;
    }

    if (noOfWithdrawals >= 3) {
      print("Maximum number of withdrawals per month exceeded.");
      return false;
    }

    this.balance -= amount;
    noOfWithdrawals += 1;
    lastWithdrawalDate = now;

    return true;
  }

  bool _isNewMonth(DateTime last, DateTime now) {
    return now.year != last.year || now.month != last.month;
  }
}
