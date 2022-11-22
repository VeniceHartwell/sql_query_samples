# sql_query_samples
This portfolio includes sample SQL queries from the Sakila dataset. The dataset includes over 16 tables with data on film rentals. Each table represents a unique part of a hypothetical film rental business, representing the way that a business might actually model its database.

## Queries in this project include:

## 1. SUBQUERIES
![SUBQUERY SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/SUBQUERIES.png)
SUBQUERIES are used to find more complex solutions to questions where multiple tables are involved. The WHERE clause will filter for specific information, for example filtering by individual countries.

## 2. JOIN + RANK
![JOIN SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/JOINS.png)
JOINS are used to connect various databases within a table.

![JOIN_RANK_SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/JOIN_RANK.png)
JOINS can be used with other functions for powerful results: in this case we use a RANK function to return ordered results from several separate tables.

## 3. HAVING
![HAVING SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/HAVING.png)
The HAVING Function is used to filter.

## 4. REGEX
![REGEX SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/REGEX.png)
REGEX is a pattern recognition language used to filter for specific text in data. It looks daunting, but it is a powerful tool. 

More complex regex queries can be found, most commonly, for email lists. The most common example is `SELECT * FROM people WHERE email NOT LIKE '%_@%_.__%'` for filtering out only effective email addresses.

## 5. IN + DISTINCT
![IN SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/IN_DISTINCT.png)
IN is a clause used to find data in another table and filter out unecessary data in the final result. DISTINCT is used to ensure no duplicates are taken.

## 6. UNION
![UNION SCREENSHOT](https://github.com/VeniceHartwell/sql_query_samples/blob/main/images/UNION_ALL.png)
UNION is used to join several tables that are similar, but not the same, by formatting any data that isn't the same in special 'unioned' columns.

### A full list
of queries made in this project can be found in the SQL file listed above. Other examples include WINDOW, POSITION, and EXISTS functions.
