USE test;

drop table user_roles;
drop table users;

drop table reservations;


drop table shows;
drop table films;

drop table seats;

CREATE  TABLE users (
  username VARCHAR(45) NOT NULL,
  name VARCHAR(45) NULL,
  surname VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  phone VARCHAR(45) NULL,
  password VARCHAR(60) NOT NULL,
  enabled TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));

CREATE TABLE films (
	film_id int(11) NOT NULL AUTO_INCREMENT,
	filmname varchar(45) NOT NULL,
	PRIMARY KEY (film_id)

);

CREATE TABLE shows (
	show_id int(11) NOT NULL AUTO_INCREMENT,
	show_date datetime NOT NULL,
	film_id int(11) NOT NULL,
	PRIMARY KEY (show_id),
 	UNIQUE KEY uni_id_date(show_date, film_id),
 	KEY fk_film_idx (film_id),
	CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES films (film_id)
);


CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationname` varchar(45) NOT NULL,
  `reservationsurname` varchar(45) DEFAULT NULL,
  `reservationemail` varchar(45) NOT NULL,
  `reservationphone` varchar(45) DEFAULT NULL,
  `reservationdate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  show_id int(11) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  
	KEY fk_show_idx (show_id),
	CONSTRAINT fk_show FOREIGN KEY (show_id) REFERENCES shows (show_id)

);
	
CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_name` VARCHAR(45) NOT NULL,
  reservation_id int(11) NOT NULL,
  PRIMARY KEY (`seat_id`),
  UNIQUE KEY uni_id_name(seat_name, reservation_id),
  KEY fk_reservation_idx (reservation_id),
  CONSTRAINT fk_reservation FOREIGN KEY (reservation_id) REFERENCES reservations (reservation_id)
);


  
INSERT INTO users(username,password,enabled)
VALUES ('pawel','$2a$10$sTb.BBlBTlAwlV66fa0zyuLmNN1iOmbAbLFsjAVvAQwUVhqGmn5Ki', true);
INSERT INTO users(username,password,enabled)
VALUES ('rafal','$2a$10$sTb.BBlBTlAwlV66fa0zyuLmNN1iOmbAbLFsjAVvAQwUVhqGmn5Ki', true);
INSERT INTO users(username,password,enabled)
VALUES ('jedrzej','$2a$10$sTb.BBlBTlAwlV66fa0zyuLmNN1iOmbAbLFsjAVvAQwUVhqGmn5Ki', true);


INSERT INTO user_roles (username, role)
VALUES ('pawel', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('pawel', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('pawel', 'ROLE_EMPLOYEE');

INSERT INTO user_roles (username, role)
VALUES ('rafal', 'ROLE_USER');

INSERT INTO user_roles (username, role)
VALUES ('jedrzej', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('jedrzej', 'ROLE_EMPLOYEE');
