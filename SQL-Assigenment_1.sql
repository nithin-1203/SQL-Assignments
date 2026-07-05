-- 1. Display the Name, Continent, and Population of all countries located in Asia
select 
	Name,
	Continent,
	Population
FROM country
WHERE Continent  = 'Asia';

-- 2. Display the Name, Population, and LifeExpectancy of all countries.Sort the results by Population in descending order.
SELECT 
	Name,
	Population,
	LifeExpectancy
FROM country
ORDER BY Population desc;

-- 3. Display the Name, Continent, and Population of countries that:belong to Europe, AND have a population greater than 20,000,000.Sort the results alphabetically by country name.

select 
	Name,
	Continent,
	Population
FROM country
where Continent = 'Europe' AND population > 20000000
order by name asc;

-- 4. Display the Name, Region, and SurfaceArea of countries that are located in either: North America, OR South America. Sort the results by region.

select 
	Name,
	Region,
	SurfaceArea
FROM country
where Region = 'North America' OR Region = 'South America'
order by Region, Name;


-- 5. Display the Name, Continent, and Population of all countries that are NOT located in Africa.
-- Sort the results by country name.

select 
	Name,
	Continent,
	Population
FROM country
where Continent !='Africa'
order by  Name;


-- 6. Display the Name, Population, and GovernmentForm of countries whose population is between 10,000,000 and 50,000,000.Sort the results by population.

select 
	Name,
	Population,
	GovernmentForm
FROM country
where population >= 10000000 and population <=50000000
order by  population desc;

-- 7. Display the Name, Capital, and Population of countries whose continent is one of the following: Asia, Europe, Oceania
select 
	Name,
	Capital,
	Population
FROM country
where continent IN ('Asia','Europe','Oceania')
order by  population desc;

-- 8. Display the Name, Region, and Population of countries whose names start with the letter 'A'
SELECT
    Name,
    Region,
    Population
FROM country
WHERE Name LIKE 'A%'
order by Name asc;

-- 9. Display the Name, Continent, Population, and LifeExpectancy of countries that:
-- are in Asia OR Europe,
-- have a population greater than 50,000,000, AND
-- have a life expectancy greater than 70.
-- Sort the results by population in descending order.

SELECT 
Name,
Continent,
Population,
LifeExpectancy
FROM country
WHERE Continent IN ('Asia', 'Europe')
  AND Population > 50000000
  AND LifeExpectancy > 70
  
ORDER BY population desc;


-- 10. Display the Name, Continent, Population, and GovernmentForm of countries that:
-- are NOT in Africa, have a population between 5,000,000 and 30,000,000,
-- and whose names contain the letter 'land'.
-- Sort the results alphabetically

SELECT 
Name,
Continent,
Population,
GovernmentForm
FROM country
WHERE Continent !='Africa'
  AND Population between 5000000 AND 30000000
  AND name LIKE '%land%'
  
ORDER BY name asc;