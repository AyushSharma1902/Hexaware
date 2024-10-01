package com.hexaware.bank;
import java.util.*;

public class BankAccountManager {
	private BankAccount account;
    private Scanner scanner;

    public BankAccountManager() {
        scanner = new Scanner(System.in);
    }

    public void createAccount() {
        System.out.print("Enter account number: ");
        String accountNumber = scanner.next();
        System.out.print("Enter initial balance: ");
        double balance = scanner.nextDouble();

        account = new BankAccount(accountNumber, balance);
        System.out.println("Account created successfully.");
    }

    public void deposit() throws NullPointerException {
        if (account == null) {
            throw new NullPointerException("Account not created.");
        }
        try {
            System.out.print("Enter deposit amount: ");
            double amount = scanner.nextDouble();
            account.deposit(amount);
            System.out.println("Deposit successful. New balance: " + account.getBalance());
        } catch (InvalidAmountException e) {
            System.out.println(e.getMessage());
        }
    }

    public void withdraw() throws NullPointerException {
        if (account == null) {
            throw new NullPointerException("Account not created.");
        }
        try {
            System.out.print("Enter withdrawal amount: ");
            double amount = scanner.nextDouble();
            account.withdraw(amount);
            System.out.println("Withdrawal successful. New balance: " + account.getBalance());
        } catch (InsufficientFundsException | InvalidAmountException e) {
            System.out.println(e.getMessage());
        }
    }

    public void checkBalance() throws NullPointerException {
        if (account == null) {
            throw new NullPointerException("Account not created.");
        }
        System.out.println("Current balance: " + account.getBalance());
    }

    public void start() {
        while (true) {
            System.out.println("Bank Account Management System");
            System.out.println("1. Create Account");
            System.out.println("2. Deposit");
            System.out.println("3. Withdraw");
            System.out.println("4. Check Balance");
            System.out.println("5. Exit");

            System.out.print("Choose an option: ");
            int choice = scanner.nextInt();

            try {
                switch (choice) {
                    case 1:
                        createAccount();
                        break;
                    case 2:
                        deposit();
                        break;
                    case 3:
                        withdraw();
                        break;
                    case 4:
                        checkBalance();
                        break;
                    case 5:
                        System.exit(0);
                        break;
                    default:
                        throw new InvalidChoiceException("Invalid choice. Please choose a valid option.");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public static void main(String[] args) {
        BankAccountManager manager = new BankAccountManager();
        manager.start();
    }
}
