-- Schema for Personal Finance Manager Database

-- Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Bank Accounts table
CREATE TABLE Bank_Accounts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    account_name VARCHAR(255) NOT NULL,
    account_type VARCHAR(50) CHECK (account_type IN ('Checking', 'Savings', 'Credit')) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL CHECK (balance >= 0),
    created_at DATE NOT NULL
);

-- Categories table
CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Transactions table
CREATE TABLE Transactions (
    id SERIAL PRIMARY KEY,
    account_id INT REFERENCES Bank_Accounts(id),
    category_id INT REFERENCES Categories(id),
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    description TEXT
);

-- Budgets table
CREATE TABLE Budgets (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    category_id INT REFERENCES Categories(id),
    amount DECIMAL(10, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);


-- Optimizations

-- Create Index on user_id for quick lookup of a user's bank accounts
CREATE INDEX idx_user_id ON Bank_Accounts(user_id);

-- Create Index on account_id for fast access to account transactions
CREATE INDEX idx_account_id ON Transactions(account_id);

-- Create Index on category_id for fast access to category-specific queries
CREATE INDEX idx_category_id ON Transactions(category_id);
