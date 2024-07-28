-- Vamos utilizar a base de dados 'world', que já vem instalada no MySQL por padrão
USE world;

-- Puxando dados de interesse sobre o Brasil
SELECT Name, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GovernmentForm, HeadOfState
FROM country
WHERE Name = 'Brazil';

-- Puxando dados da América do Sul, ordenados de forma decrescente pelo tamanho da população
SELECT Name, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GovernmentForm, HeadOfState
FROM country
WHERE Region = 'South America'
ORDER BY Population DESC;

-- Quantos idiomas são falados na Bélgica? Quantos desses são oficiais?
SELECT IsOfficial, COUNT(*) AS 'Quantidade de idiomas'
FROM countrylanguage
WHERE CountryCode = 'BEL'
GROUP BY IsOfficial;

-- Quais os países que falam português?
SELECT country.Name, countrylanguage.Language
FROM country
JOIN countrylanguage 
ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.language = 'Portuguese';

-- As maiores cidades do mundo ficam em qual região geográfica?
SELECT city.Name, country.Name, country.Region, city.Population
FROM city
JOIN country
ON city.CountryCode = country.Code
ORDER BY city.Population DESC;

-- Qual o país com maior expectativa de vida e quantos idiomas são falados oficialmente?
SELECT country.Name, country.LifeExpectancy, COUNT(countrylanguage.Language) AS 'Quantidade de idiomas oficiais'
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE country.LifeExpectancy = (
SELECT MAX(country.LifeExpectancy)
FROM country)
AND countrylanguage.IsOfficial = 'T'
GROUP BY country.Name, country.LifeExpectancy;



