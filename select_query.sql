--- SELECT statement
--- to use any database run below query
--- this clause will use the database
USE MyDatabase

--- multiline comment
/* this can be used
to 
do the multiline comment in SQl*/

--- retrive all the customer data
SELECT * FROM customers;

/* SELECT * TELLS WHAT TO SELECT 
AND FROM TELLS WHICH TABLE TO SELECT FROM
*/

--- retrive all the orders data

SELECT *
FROM orders;

--- SELECT ORDER order_date FROM ORDERS 
SELECT 
	order_date,
	sales
FROM orders;

--- select score from country
SELECT country
FROM customers;

--- the execution of sql starts from the FROM clause and then it goes to the select statement

---  -----------------------------Where Clause------------------------------------------
--- filters the data based on the condition

--- select from customers where score is not 0 and country is germany
SELECT 
	first_name AS FIRST_NAME,
	id AS ID
FROM 
	customers
WHERE 
	score!=0 OR LOWER(country)='germany';

---  -----------------------------ORDER BY Clause------------------------------------------
--- ASC fore asecding and DESC for decending 
--- order customers with ascending and decending score
SELECT *
FROM customers
ORDER BY score 
--- by default order is set tp ascending 

--- DESC
SELECT *
FROM 
	customers
ORDER BY 
	score DESC;

--- Nested sorting
--- select all the customers with ascending country name and descending score

SELECT * 
FROM customers
ORDER BY 
	country ASC,     --- here order is important as first caluse will be excuted first
	score DESC;


------------------------------------------GROUP BY------------------------------------------
--- THIS aggregates the one column with another column values
--- use customers and group data by country and show total scores
--- after that sort this in desc 
SELECT 
	country,
	SUM(score) AS Total_Score --- AS stands for ALIAS
FROM customers
GROUP BY country
ORDER BY Total_Score DESC;
/* NOTE: column you are grouping must be present in the select statement and no other columns.
	if you want to add any other column then it must be aggregated.
*/

--- find the total score and total numbert of customers for that country
SELECT
	country,
	COUNT(first_name) AS total_people,
	SUM(score) AS Total_Score
FROM
	customers
/*
WHERE
	score>350   --- where clause should always come after from clause */
GROUP BY 
	country
ORDER BY 
	Total_Score DESC;

------------------------------ HAVING clause -----------------------------------
--- this clause is used after group by clause.
--- when you want to put condition on the result or group by clause.

SELECT
	country,
	COUNT(first_name) AS total_people,
	SUM(score) AS Total_Score
FROM
	customers
/*
WHERE
	score>350   --- where clause should always come after from clause */
GROUP BY 
	country
HAVING 
	SUM(score) >  750 --- CAN ONLY USE AGGREAGTE FUNCTION HER
ORDER BY 
	Total_Score DESC;


/*

	find the average score of each country 
	considering only customers with score is not equal to 0 
	return only those country with avg score > 430

*/

SELECT 
	country,
	AVG(score) AS average_score
FROM customers
WHERE
	score!=0
GROUP BY 
	country
HAVING
	AVG(score)>430

SELECT AVG(score) FROM customers --- Aggregating function will work even if no group by is configured as is groups all the records

-------------------------------------- DISTINCT ------------------------------------------------------
--- Removes the duplicate or duplicate valuse
--- return unique list of all the country

SELECT DISTINCT --- DISTINCT keyword should always come after select statement.
	country
FROM customers

SELECT  --- DISTINCT keyword should always come after select statement.
	COUNT(DISTINCT country) --- this will count the unique country
FROM customers

----------------------------------------------- TOP keyword -------------------------------------------
--- top is restriction on how muchj roes you want to return / display
---- numbers of rows to be return
--- retriver only three customers

SELECT TOP 3 --- ONly first 3 rows will be displayed
	country
FROM customers

--- display top 3 customer with highest score
SELECT TOP 3
	*
FROM customers
ORDER BY 
	score DESC

---- GET the two most recent orders from orders table
SELECT TOP 2 *
FROM orders
ORDER BY 
	order_date DESC

-------------------------------------------------- CODING ORDER ----------------------------------------
/*
	SELECT DISTINCT TOP 2
		col_name,
		COL1,
		COL2,
		COL3
	FROM TABLENAME
	WHERE
		WHERE_CONDITION
	GROUP BY col_name
	HAVING 
		aggregation_col
	ORDER BY
		COL1 ASC,
		col2 DESC


*/