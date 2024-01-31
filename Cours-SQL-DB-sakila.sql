-- COURS PERSONNEL SQL 

-- Cours de base sur les requetes SQL 
-- Clause SELECT (permet d'interroger la base de données)

SELECT * 
FROM customer;

-- DISTINCT (lister sans doublons )
SELECT DISTINCT store_id 
FROM customer;

-- WHERE (filtrer les lignes à retourner)
SELECT last_name
from customer
WHERE last_name = 'BROWN';

-- AS (utiliser pour renommer temporairement colones oun tables)

-- COUNT (nbs de ligne ds une table qui repondent au critères)
SELECT COUNT(*) AS 'nbs-de-ligne' FROM customer;

-- LIMIT (limiter le nbs max à afficher)

-- ORDER by (Trier les ligne par ASCendant ou DESC)
SELECT first_name,
last_name
FROM customer 
ORDER BY first_name DESC;

-- LIKE (recherche de valeurs )
SELECT first_name
FROM customer
WHERE first_name LIKE "L%";

-- IN or NOT IN (lister les ceux qui ont les mm valeur que l condition), BETWEEN (entre)
SELECT store_id 
From customer 
WHERE store_id IN (1);

-- LES FONCTIONS AGGREGATION

-- AVG()   , MIN() ,  MAX()   , SUM () 
SELECT SUM(amount)
FROM payment;

-- GROUP BY (Regroupe les fonction d'agregation)
 SELECT customer_id,SUM(amount)
 FROM  payment
GROUP BY customer_id;

-- SELECT rating, COUNT(rating)
-- FROM film
-- GROUP BY rating

-- HAVING (filtrer le resultat GROUP BY )
-- HAVING SUM(amount)==200; 

-- JOINTURES (combiner plusieurs tables )
-- EX: Pour lire l'adresse de chaque personne, il faut faire une jointures entre table personnes et adresse 
SELECT customer.customer_id,
first_name,
last_name,
amount, 
payment_date
FROM customer
INNER JOIN payment ON customer.customer_id=payment.customer_id;

-- UNION (concatener deux tables )
-- SELECT * FROM table1
-- UNION 
-- SELECT * FROM table2;

-- SQL AVANCEES 
-- EXTRACT (Fonctions date et heures) 

SELECT extract(month FROM payment_date) AS mois 
FROM payment;

-- examples : Chiffres d'affaire par mois 
SELECT extract(month FROM payment_date) AS mois,
SUM(amount)
FROM payment
GROUP BY extract(month FROM payment_date)
ORDER BY 1;

-- Chaines de caractères 
-- CONCAT()

SELECT customer_id,
CONCAT(first_name, ' ' , last_name)
email
FROM customer;

-- Les Sous requetes 
SELECT title,
rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);







