import 'bank-account.class.dart';
import 'bank_branch.class.dart';
import 'checking-account.class.dart';
import 'investment-account.class.dart';
import 'risk.enum.dart';
import 'saving-account.class.dart';

void main() {
  BankAccount saving = SavingsAccount(1101, "Mohamed", 10000, 1423);
  BankAccount checking = CheckingAccount(1102, "Omar", 25000, 1423, 3000);
  BankAccount investment = InvestmentAccount(
    1103,
    "Ahmed",
    50000,
    1423,
    Risk.LOW,
  );

  print("===== Before Annual ======");
  saving.printInfo();
  checking.printInfo();
  investment.printInfo();
  BankBranch branch = BankBranch("Main Branch", [saving, checking, investment]);
  branch.applyAnnualInterest(1.5);
  print("===== After Annual ======");
  saving.printInfo();
  checking.printInfo();
  investment.printInfo();
  BankAccount.transferFunds(saving, checking, 2500);
  print("===== After Transfer ======");
  saving.printInfo();
  checking.printInfo();
  investment.printInfo();
}
