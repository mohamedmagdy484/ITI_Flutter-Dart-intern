import 'dart:io';

class Account {
  int accountNumber;
  String ownerName;
  double balance;

  Account(this.accountNumber, this.ownerName, this.balance);
}


abstract class Rollback {
  double cancelTransaction(Account account);
}


abstract class Transaction {
  int transactionId;
  Transaction(this.transactionId);

  double execute(Account account);
}


class Deposit extends Transaction implements Rollback {
  double amount;

  Deposit(int id, this.amount) : super(id);

  @override
  double execute(Account account) {
    account.balance += amount;
    print("Deposited $amount. New Balance: ${account.balance}");
    return account.balance;
  }

  @override
  double cancelTransaction(Account account) {
    account.balance -= amount;
    print("Transaction Cancelled (Deposit undone). Balance: ${account.balance}");
    return account.balance;
  }
}


class Withdraw extends Transaction implements Rollback {
  double amount;

  Withdraw(int id, this.amount) : super(id);

  @override
  double execute(Account account) {
    if (account.balance >= amount) {
      account.balance -= amount;
      print("Withdrawn $amount. New Balance: ${account.balance}");
    } else {
      print("Insufficient funds!");
    }
    return account.balance;
  }

  @override
  double cancelTransaction(Account account) {
    account.balance += amount;
    print("Transaction Cancelled (Withdrawal undone). Balance: ${account.balance}");
    return account.balance;
  }
}


class BalanceInquiry extends Transaction {
  String currencyType;

  BalanceInquiry(int id, this.currencyType) : super(id);

  @override
  double execute(Account account) {
    double rate = 1.0;
    String symbol = "LE";

    if (currencyType.toUpperCase() == 'U') {
      rate = 0.02;
      symbol = "\$";
    } else if (currencyType.toUpperCase() == 'E') {
      rate = 0.018;
      symbol = "€";
    }

    double convertedBalance = account.balance * rate;
    print("Current Balance: $convertedBalance $symbol");
    return convertedBalance;
  }
}


void main() {
  Account? myAccount;
  Transaction? lastTransaction;
  int transactionCounter = 1;

  while (true) {
    print('\n--- ATM Menu ---');
    print('1. Enter account details');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Show current balance');
    print('5. Cancel last transaction');
    print('6. Exit');
    stdout.write('Choose an option: ');

    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Enter Account Number: ');
        int accNum = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Owner Name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter Initial Balance: ');
        double bal = double.parse(stdin.readLineSync()!);
        myAccount = Account(accNum, name, bal);
        print("Account Created Successfully!");
        break;

      case '2':
        if (myAccount == null) { print("Create account first!"); break; }
        stdout.write('Enter amount to deposit: ');
        double amount = double.parse(stdin.readLineSync()!);
        var deposit = Deposit(transactionCounter++, amount);
        deposit.execute(myAccount);
        lastTransaction = deposit;
        break;

      case '3':
        if (myAccount == null) { print("Create account first!"); break; }
        stdout.write('Enter amount to withdraw: ');
        double amount = double.parse(stdin.readLineSync()!);
        var withdraw = Withdraw(transactionCounter++, amount);
        withdraw.execute(myAccount);
        lastTransaction = withdraw;
        break;

      case '4':
        if (myAccount == null) { print("Create account first!"); break; }
        stdout.write('Enter currency (U for USD, E for Euro, Other for Local): ');
        String curr = stdin.readLineSync()!;
        var inquiry = BalanceInquiry(transactionCounter++, curr);
        inquiry.execute(myAccount);
        break;

      case '5':
        if (myAccount == null) { print("Create account first!"); break; }
        if (lastTransaction != null && lastTransaction is Rollback) {
          (lastTransaction as Rollback).cancelTransaction(myAccount);
          lastTransaction = null;
        } else {
          print("No cancellable transaction found.");
        }
        break;

      case '6':
        exit(0);

      default:
        print("Invalid option");
    }
  }
}