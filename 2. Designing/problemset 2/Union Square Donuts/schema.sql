CREATE TABLE Ingredients (
    ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price_per_unit REAL NOT NULL,
    unit TEXT NOT NULL
);

CREATE TABLE Donuts (
    donut_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);


CREATE TABLE Donut_Ingredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES Donuts(donut_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id),
    PRIMARY KEY (donut_id, ingredient_id)
);

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Donuts (
    order_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(donut_id),
    PRIMARY KEY (order_id, donut_id)
);


INSERT INTO Ingredients (name, price_per_unit, unit) VALUES ('Cocoa', 5.00, 'pound');
INSERT INTO Ingredients (name, price_per_unit, unit) VALUES ('Sugar', 2.00, 'pound');
INSERT INTO Ingredients (name, price_per_unit, unit) VALUES ('Flour', 1.00, 'pound');
INSERT INTO Ingredients (name, price_per_unit, unit) VALUES ('Buttermilk', 1.50, 'pound');
INSERT INTO Ingredients (name, price_per_unit, unit) VALUES ('Sprinkles', 3.00, 'pound');


INSERT INTO Donuts (name, gluten_free, price) VALUES ('Belgian Dark Chocolate', 0, 4.00);
INSERT INTO Donuts (name, gluten_free, price) VALUES ('Back-To-School Sprinkles', 0, 4.00);


INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (1, 1); -- Belgian Dark Chocolate has Cocoa
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (1, 3); -- Belgian Dark Chocolate has Flour
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (1, 4); -- Belgian Dark Chocolate has Buttermilk
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (1, 2); -- Belgian Dark Chocolate has Sugar

INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (2, 3); -- Back-To-School Sprinkles has Flour
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (2, 4); -- Back-To-School Sprinkles has Buttermilk
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (2, 2); -- Back-To-School Sprinkles has Sugar
INSERT INTO Donut_Ingredients (donut_id, ingredient_id) VALUES (2, 5); -- Back-To-School Sprinkles has Sprinkles


INSERT INTO Customers (first_name, last_name) VALUES ('Luis', 'Singh');


INSERT INTO Orders (customer_id) VALUES (1);


INSERT INTO Order_Donuts (order_id, donut_id, quantity) VALUES (1, 1, 3); -- 3 Belgian Dark Chocolate
INSERT INTO Order_Donuts (order_id, donut_id, quantity) VALUES (1, 2, 2); -- 2 Back-To-School Sprinkles
