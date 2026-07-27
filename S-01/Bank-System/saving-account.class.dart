import 'bank-account.class.dart';

class SavingsAccount extends BankAccount {
  double _interestRate;
  int noOfWithdrawals = 0;
  DateTime? lastWithdrawalDate;

  SavingsAccount(
    int accountNumber,
    String holderName,
    double balance,
    int pin,
    this._interestRate,
  ) : super(accountNumber, holderName, balance, pin);

  get interestRate => _interestRate;

  set interestRate(double rate) => _interestRate = rate;

  @override
  double interest(double rate) {
    // TODO: implement interest
    double interest = this.balance * (rate / 100);
    return interest;
  }

  @override
  @override
  void withdraw(int pin, double amount) {
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

    final now = DateTime.now();
    if (lastWithdrawalDate != null && _isNewMonth(lastWithdrawalDate!, now)) {
      noOfWithdrawals = 0;
    }

    if (noOfWithdrawals >= 3) {
      print("Maximum number of withdrawals per month exceeded.");
      return;
    }

    this.balance -= amount;
    noOfWithdrawals += 1;
    lastWithdrawalDate = now;
  }

  bool _isNewMonth(DateTime last, DateTime now) {
    return now.year != last.year || now.month != last.month;
  }
}
