abstract class BankAccount {
  int _accountNumber;
  String _holderName;
  double _balance;
  int _pin;

  BankAccount(this._accountNumber, this._holderName, this._balance, this._pin);

  // ====== GETTERS ======
  int get accountNumber => _accountNumber;
  String get holderName => _holderName;
  double get balance => _balance;
  int get pin => _pin;

  // ====== SETTERS ======
  set pin(int pin) => _pin = pin;

  void deposit(double amount) {
    if (amount <= 0) {
      print("Cannot deposit negative amount.");
      return;
    }
    _balance += amount;
  }

  void withdraw(int pin, double amount) {
    if (pin != _pin) {
      print("Incorrect PIN.");
      return;
    }
    if (amount <= 0) {
      print("Cannot withdraw negative amount.");
      return;
    }
    if (amount > _balance) {
      print("Insufficient balance.");
      return;
    }
    _balance -= amount;
  }

  double interest(double rate);

  void printInfo() {
    print("Account Number: $_accountNumber");
    print("Holder Name: $_holderName");
    print("Balance: $_balance");
  }
}
