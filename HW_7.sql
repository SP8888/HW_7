-- Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

SELECT from_user_id FROM messages
	WHERE to_user_id = 78
	AND from_user_id IN (
SELECT friend_id FROM friendship WHERE user_id = to_user_id 
union
SELECT user_id FROM friendship WHERE friend_id = to_user_id );


SELECT * from target_types;

SELECT * FROM profiles ORDER BY birthdate DESC LIMIT 10;

SELECT target_id, COUNT(*) FROM likes
	WHERE target_type_id = 2
		AND target_id IN (SELECT * FROM (
		SELECT user_id FROM profiles ORDER BY birthdate DESC LIMIT 10
	) as sorted_profiles)
	GROUP BY target_id;

SELECT SUM(likes_per_user) AS likes_total FROM (
	SELECT COUNT(*) AS likes_per_user 
		FROM likes
			WHERE target_type_id = 2
				AND target_id IN (SELECT * FROM (
					SELECT user_id FROM profiles ORDER BY birthdate DESC LIMIT 10
				) as sorted_profiles
			)
	GROUP BY target_id 
) AS counted_likes;

SELECT CASE (sex)
		WHEN 'm' THEN 'man'
		WHEN 'f' THEN 'woman'
	END AS sex,
	COUNT(*) as likes_count 
	FROM (
		SELECT 
		user_id as user,
			(SELECT sex FROM profiles WHERE user_id = user ) as sex
			FROM likes) dummy_table
		group by sex
		order by likes_count DESC 
	limit 2;

-- сети.     
SELECT CONCAT(first_name, ' ', last_name) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) 
	AS overall_activity 
	FROM users
	ORDER BY overall_activity
	LIMIT 30;





show tables;
SELECT * from day_birthday ;
SELECT * from user ;

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Геннадий';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 2 FROM products
WHERE name = 'Intel Core i5-7400';

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Наталья';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 1 FROM products
WHERE name IN ('Intel Core i5-7400', 'Gigabyte H310M S2H');

INSERT INTO orders (user_id)
SELECT id FROM users WHERE name = 'Иван';

INSERT INTO orders_products (order_id, product_id, total)
SELECT LAST_INSERT_ID(), id, 1 FROM products
WHERE name IN ('AMD FX-8320', 'ASUS ROG MAXIMUS X HERO');

SELECT id, name FROM users;
SELECT * FROM orders;


SELECT
  u.id, u.name
FROM
  users AS u
JOIN
  orders AS o
ON
  u.id = o.user_id;
 
 
 SELECT
  p.id,
  p.name,
  p.price,
  c.name AS catalog
FROM
  products AS p
LEFT JOIN
  catalogs AS c
ON
  p.catalog_id = c.id;
 
 
 
 
 
 
 DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255) COMMENT 'Город отравления',
  `to` VARCHAR(255) COMMENT 'Город прибытия'
) COMMENT = 'Рейсы';

INSERT INTO flights (`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT 'Код города',
  name VARCHAR(255) COMMENT 'Название города'
) COMMENT = 'Словарь городов';

INSERT INTO cities (label, name) VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT
  f.id,
  cities_from.name AS `from`,
  cities_to.name AS `to`
FROM flights AS f
  LEFT JOIN cities AS cities_from
    ON f.from = cities_from.label
  LEFT JOIN cities AS cities_to
    ON f.to = cities_to.label;
   
  
SELECT * FROM cities;
SELECT * FROM flights f ;
  
 
 
	

	



	




