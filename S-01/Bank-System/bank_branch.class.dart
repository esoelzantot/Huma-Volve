import 'bank-account.class.dart';

class BankBranch {
  String name;
  List<BankAccount> accounts = [];

  BankBranch(this.name, this.accounts);

  void addAccount(BankAccount account) => accounts.add(account);

  void applyAnnualInterest(double rate) {
    for (var account in accounts) {
      double interestAmount = account.interest(rate);
      account.balance += interestAmount;
    }
  }
}
