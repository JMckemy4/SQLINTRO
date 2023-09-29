/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name AS "Products Name", c.Name AS "Categories Name"
FROM products AS p
INNER JOIN categories AS c 
ON c.CategoryID = p.CategoryID
WHERE c.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products AS p 
INNER JOIN reviews AS r 
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS Total
FROM sales AS s 
INNER JOIN employees AS e 
ON e.EmployeeID = s.EmployeeID 
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY Total DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS DepartmentName, c.Name AS CategoryName
FROM departments AS d
INNER JOIN categories as c
WHERE c.Name = 'Appliances' OR c.Name = 'Games';
/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.Name, SUM(s.Quantity) AS Total_Sold, SUM(s.Quantity * p.Price) AS Total_Price
FROM products AS p
INNER JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE p.Name = 'Eagles: Hotel California'
GROUP BY p.Name; 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name = 'Visio TV'
AND r.Rating = (SELECT MIN(Rating) FROM reviews WHERE ProductID = p.ProductID);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */