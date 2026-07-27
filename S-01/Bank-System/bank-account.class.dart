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
  set balance(double balance) => {
    if (balance >= 0)
      _balance = balance
    else
      print("Cannot set negative balance."),
  };

  // ====== METHODS ======
  void withdraw(int pin, double amount);
  double interest(double rate);

  void deposit(double amount) {
    if (amount <= 0) {
      print("Cannot deposit negative amount.");
      return;
    }
    _balance += amount;
  }

  void printInfo() {
    print("Account Number: $_accountNumber");
    print("Holder Name: $_holderName");
    print("Balance: $_balance");
  }
}
