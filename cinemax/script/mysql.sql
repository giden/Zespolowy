USE test;

CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(60) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
*/
CREATE TABLE films (
	film_id int(11) NOT NULL AUTO_INCREMENT,
	filmname varchar(45) NOT NULL,
	PRIMARY KEY (film_id)

)
  
INSERT INTO users(username,password,enabled)
VALUES ('pawel','$2a$10$04TVADrR6/SPLBjsK0N30.Jf5fNjBugSACeGv1S69dZALR7lSov0y', true);
INSERT INTO users(username,password,enabled)
VALUES ('rafal','$2a$10$sTb.BBlBTlAwlV66fa0zyuLmNN1iOmbAbLFsjAVvAQwUVhqGmn5Ki', true);

INSERT INTO user_roles (username, role)
VALUES ('pawel', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('pawel', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('rafal', 'ROLE_USER');
