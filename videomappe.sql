/* Dette scriptet var laget til bruk i den tredje videon i videomappen */

/* Lager en Schema "videomappe", og legger til alle tabeller der. */
CREATE SCHEMA `videomappe`;

CREATE TABLE videomappe.`game` (
`ID` INT NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(45) NOT NULL,
PRIMARY KEY (ID));

CREATE TABLE videomappe.`platform` (
`ID` INT NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(45) NOT NULL,
`ReleaseDate` DATE,
PRIMARY KEY (ID));

CREATE TABLE videomappe.`reviewer` (
`ID` INT NOT NULL AUTO_INCREMENT,
`FirstName` VARCHAR(45) NOT NULL,
`SurName` VARCHAR(45),
PRIMARY KEY (ID));


CREATE TABLE videomappe.`gameReview` (
`gameID` INT NOT NULL,
`reviewerID` INT NOT NULL,
`rating` FLOAT NOT NULL,
`writtenReview` TEXT,
PRIMARY KEY(gameID, reviewerID),
FOREIGN KEY(gameID) REFERENCES game(ID),
FOREIGN KEY(reviewerID) REFERENCES reviewer(ID));

CREATE TABLE videomappe.`gamePlatform` (
`gameID` INT NOT NULL,
`platformID` INT NOT NULL,
`cost` FLOAT,
PRIMARY KEY (gameID, platformID),
FOREIGN KEY(gameID) REFERENCES game(ID),
FOREIGN KEY(platformID) REFERENCES platform(ID));

CREATE TABLE videomappe.`platformReview` (
`platformID` INT NOT NULL,
`reviewerID` INT NOT NULL,
`rating` FLOAT NOT NULL,
`writtenReview` TEXT,
PRIMARY KEY (platformID, reviewerID),
FOREIGN KEY(platformID) REFERENCES platform(ID),
FOREIGN KEY(reviewerID) REFERENCES reviewer(ID));



/* Legger data inn i tabellene. */

INSERT INTO videomappe.game (Name)
VALUES ('Overwatch'), ('Total War: Warhammer II'), ('X-Com: UFO Defense');

INSERT INTO videomappe.platform (Name, ReleaseDate)
VALUES ('Steam', STR_TO_DATE('12-09-2003', '%d-%m-%Y')), ('Blizzard Battle.net', STR_TO_DATE('01-08-2013', '%d-%m-%Y')), ('Playstation 4', STR_TO_DATE('15-11-2013', '%d-%m-%Y')), ('Xbox One', STR_TO_DATE('22-11-2013', '%d-%m-%Y'));

INSERT INTO videomappe.reviewer (Firstname, Surname)
VALUES ('Tomas', 'Sandnes'), ('Kenneth', 'Hoff');

INSERT INTO videomappe.gameReview (gameID, reviewerID, rating, writtenReview)
VALUES (1, 1, 6, "Fine"), (2, 2, 9, "Fantastic strategy game. Highly recommended"), (3, 2, 9, "Oldie but a goldie");

INSERT INTO videomappe.gamePlatform (gameID, platformID, cost)
VALUES (1, 2, 400), (1, 3, 600), (1, 4, 600), (2, 1, 560);

INSERT INTO videomappe.platformReview (platformID, reviewerID, rating, writtenReview)
VALUES (1, 2, 7, "Most games on the market. Always up-to-date. #NetworkEffect");