CREATE TABLE film (
	film_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(128),
	description TEXT,
	release_year DATE
);

CREATE TABLE actor(
	actor_id INT AUTO_INCREMENT PRIMARY KEY ,
	first_name VARCHAR(64),
	last_name VARCHAR(64)
);

CREATE TABLE film_actor(
	film_id INT NOT NULL,
	actor_id INT NOT NULL
);

ALTER TABLE film
	ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	AFTER release_year;
	
ALTER TABLE actor
	ADD last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	AFTER last_name;
	
ALTER TABLE film_actor
	ADD FOREIGN KEY (film_id) REFERENCES film(film_id),
	ADD FOREIGN KEY (actor_id) REFERENCES actor(actor_id);
	
INSERT INTO film(title, description, release_year) VALUES
	('BOULEVARD MOB','A Fateful Epistle of a Moose And a Monkey who must Confront a Lumberjack in Ancient China','2006-01-01'),
	('CASPER DRAGONFLY','A Intrepid Documentary of a Boat And a Crocodile who must Chase a Robot in The Sahara Desert','2006-02-02'),
	('CHAINSAW UPTOWN','A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia','2006-03-03'),
	('CHOCOLATE DUCK','A Unbelieveable Story of a Mad Scientist And a Technical Writer who must Discover a Composer in Ancient China','2006-04-04'),
	('CONSPIRACY SPIRIT','A Awe-Inspiring Story of a Student And a Frisbee who must Conquer a Crocodile in An Abandoned Mine Shaft','2006-05-05'),
	('CONTACT ANONYMOUS','A Insightful Display of a A Shark And a Monkey who must Face a Database Administrator in Ancient India','2006-06-06');
	
	
INSERT INTO actor(first_name, last_name) VALUES
	('WALTER','TORN'),
	('MATTHEW','LEIGH'),
	('PENELOPE','CRONYN'),
	('CHRISTOPHER','BERRY'),
	('KIRSTEN','AKROYD'),
	('ELLEN','PRESLEY');
	
INSERT INTO film_actor VALUES 
	(1,2),
	(2,1),
	(3,4),
	(4,3),
	(5,6),
	(6,5);
