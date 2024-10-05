-- Queries for Personal Finance Manager

-- 1. Insert a new user
-- Adds a new user to the Users table
INSERT INTO Users (name, email, password)
VALUES ('heba', 'heba@example.com', '123');

-- 2. Insert a new bank account for a user
-- Adds a new checking account for user with id 1
INSERT INTO Bank_Accounts (user_id, account_name, account_type, balance)
VALUES (1, 'Main Checking', 'Checking', 1000.00);

-- 3. Insert a new category
-- Adds a new category to track grocery expenses
INSERT INTO Categories (name)
VALUES ('Groceries');

-- 4. Insert a new transaction
-- Adds a transaction for groceries in the Main Checking account
INSERT INTO Transactions (account_id, category_id, amount, description)
VALUES (1, 1, -50.00, 'Grocery Shopping at Supermarket');

-- 5. Set up a budget for groceries
-- Sets a monthly budget of $500 for groceries for user with id 1
INSERT INTO Budgets (user_id, category_id, amount, start_date, end_date)
VALUES (1, 1, 500.00, '2024-10-01', '2024-10-31');

-- 6. View a user’s account balances
-- Retrieves the current balances for all accounts belonging to user with id 1
SELECT account_name, balance
FROM Bank_Accounts
WHERE user_id = 1;

-- 7. View all transactions for a specific account
-- Retrieves all transactions for the Main Checking account (account_id = 1)
SELECT transaction_date, description, amount
FROM Transactions
WHERE account_id = 1
ORDER BY transaction_date DESC;

-- 8. View all transactions by category
-- Retrieves all transactions in the 'Groceries' category
SELECT t.transaction_date, t.description, t.amount
FROM Transactions t
JOIN Categories c ON t.category_id = c.id
WHERE c.name = 'Groceries'
ORDER BY t.transaction_date DESC;

-- 9. Update an account balance after a transaction
-- Updates the Main Checking account's balance after a grocery transaction
UPDATE Bank_Accounts
SET balance = balance - 50.00
WHERE id = 1;

-- 10. Update a user’s budget
-- Updates the grocery budget to $600 for the month of October
UPDATE Budgets
SET amount = 600.00
WHERE user_id = 1 AND category_id = 1 AND start_date = '2024-10-01';

-- 11. Delete a transaction
-- Deletes the transaction with id 1 (for demonstration purposes)
DELETE FROM Transactions
WHERE id = 1;

-- 12. Delete an account
-- Deletes the Main Checking account and all its associated transactions
DELETE FROM Bank_Accounts
WHERE id = 1;

-- 13. View budget usage for a category
-- Retrieves the total spending in the 'Groceries' category for the current month
SELECT SUM(t.amount) AS total_spent
FROM Transactions t
JOIN Categories c ON t.category_id = c.id
WHERE c.name = 'Groceries' AND t.transaction_date BETWEEN '2024-10-01' AND '2024-10-31';
