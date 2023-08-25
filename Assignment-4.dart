abstract class Account {
  late int accountNumber;
  late double balance;

  Account(this.accountNumber, this.balance);

  deposit(double amount) {
    if (amount > 0) {
      balance = balance + amount;
      print('Deposited: $amount');
    } else {
      print('Invalid deposit amount.');
    }
  }

  withdraw(double amount);
}

class SavingsAccount extends Account {
  late double interestRate;

  SavingsAccount(super.accountNumber, super.balance, this.interestRate);

  @override
  withdraw(double amount) {
    if (amount > 0) {
      balance = balance - amount;
      balance = balance + (balance * interestRate);
      print('Withdrawn: $amount');
    } else {
      print('Invalid withdrawal amount.');
    }
  }
}

class CurrentAccount extends Account {
  late double overdraftLimit;

  CurrentAccount(super.accountNumber, super.balance, this.overdraftLimit);

  @override
  withdraw(double amount) {
    double availableBalance = balance + overdraftLimit;
    if (amount > 0 && amount <= availableBalance) {
      balance = balance - amount;
      print('Withdrawn: $amount');
    } else {
      print('Insufficient funds.');
    }
  }
}

void main() {
  SavingsAccount zaman = SavingsAccount(10012023, 500, 0.04);
  zaman.deposit(1000);
  zaman.withdraw(200);
  print('Your Savings Account Balance: ${zaman.balance}');

  print('');

  CurrentAccount akijCompany = CurrentAccount(202351023, 10000, 1000);
  akijCompany.deposit(1000);
  akijCompany.withdraw(12500);
  print('Your Current Account Balance: ${akijCompany.balance}');
}
