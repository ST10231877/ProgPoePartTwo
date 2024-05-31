INSERT INTO Farmers (Name, Location, ContactInfo)
VALUES 
('John Toe', 'Western Cape', 'john.toe@poe.com'),
('Marianne Fling', 'Gauteng', 'marianne.fling@poe.com'),
('Ahmed Khan', 'KwaZulu-Natal', 'ahmed.khan@poe.com'),
('Emily Brown', 'Free State', 'emily.brown@poe.com');

INSERT INTO Products (FarmerID, ProductName, Category, Quantity, Price)
VALUES 
(1, 'Tomatoes', 'Vegetables', 500, 10.00),
(1, 'Lettuce', 'Vegetables', 300, 8.50),
(2, 'Apples', 'Fruits', 1000, 5.75),
(2, 'Oranges', 'Fruits', 800, 6.20),
(3, 'Milk', 'Dairy', 200, 12.00),
(3, 'Cheese', 'Dairy', 150, 25.00),
(4, 'Wheat', 'Grains', 1000, 4.00),
(4, 'Barley', 'Grains', 800, 3.75);

WITH CTE AS (
    SELECT 
        ProductID,
        FarmerID,
        ProductName,
        Category,
        Quantity,
        Price,
        ROW_NUMBER() OVER (PARTITION BY FarmerID, ProductName, Category, Quantity, Price ORDER BY ProductID) AS row_num
    FROM 
        Products
)
DELETE FROM CTE
WHERE row_num > 1;

WITH CTE AS (
    SELECT 
        FarmerID,
        Name,
        Location,
        ContactInfo,
        ROW_NUMBER() OVER (PARTITION BY Name, Location, ContactInfo ORDER BY FarmerID) AS row_num
    FROM 
        Farmers
)
DELETE FROM CTE
WHERE row_num > 1;
