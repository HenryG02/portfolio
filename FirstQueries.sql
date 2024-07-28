USE world;

-- Puxando dados de interesse sobre o Brasil
SELECT Name, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GovernmentForm, HeadOfState
FROM country
WHERE Name = 'Brazil';

-- Os dados são MUITO antigos xD
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
-- Obtendo o país com maior expectativa de vida
SELECT country.Name, country.LifeExpectancy
FROM country
ORDER BY country.LifeExpectancy DESC; -- O país com maior expectativa de vida é Andorra

-- Obtendo o país com maior expectativa de vida (opção alternativa)
SELECT country.Name
FROM country
WHERE country.LifeExpectancy = (
SELECT MAX(country.LifeExpectancy)
FROM country); -- Solução alternativa

SELECT country.Name, country.LifeExpectancy, COUNT(countrylanguage.Language) AS 'Quantidade de idiomas oficiais'
FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
WHERE country.LifeExpectancy = (
SELECT MAX(country.LifeExpectancy)
FROM country)
AND countrylanguage.IsOfficial = 'T'
GROUP BY country.Name, country.LifeExpectancy;



