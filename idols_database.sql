create database kpop_idol;

show database;

use kpop_idol;

CREATE TABLE idol (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `stage_name` VARCHAR(200),
  `real_name` VARCHAR(200),
  `Nationality` VARCHAR(100),
  `debut_year` YEAR,
);

describe idol;

INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`) VALUES ('Tzuyu', 'Chou-TzuYU', 'Taiwan', '2015');
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`) VALUES ('Sana', 'Minatozaki-Sana', 'Japanese', '2015');
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`) VALUES ('Nayeon', 'Im_Nayeon', 'Korean', '2015');
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`) VALUES ('Mina', 'Myoui_Mina', 'Japanese', '2015');

SELECT * FROM idol;

CREATE TABLE group (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `group_name` VARCHAR(200),
  `agency` VARCHAR(200),
  `fandom_name` VARCHAR(45)
);

describe group;

INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Twice', 'JYP_entertaiment', 'Once');
INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Blackpink', 'YG_entertaiment', 'Blink');
INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Babymonster', 'YG_entertaiment', 'MONSTIEZ');

SELECT * FROM group;

CREATE TABLE album (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(200),
  `release_date` DATE,
  `genre` VARCHAR(50)
);

describe album;

INSERT INTO album (`title`, `release_date`, `genre`) VALUES ('READY TO BE', '2023-03-10', 'K-pop');
INSERT INTO album (`title`, `release_date`, `genre`) VALUES ('TEN: The Story Goes On', '2025-10-10', 'K-pop');
INSERT INTO album (`title`, `release_date`, `genre`) VALUES ('BETWEEN 1&2', '2022-08-26', 'K-pop');

SELECT * FROM users;

CREATE TABLE schedule (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `event_type` VARCHAR(200),
  `event_date` DATE NOT NULL,
  `location` VARCHAR(100)
);

describe schedule;

INSERT INTO schedule (`event_type`, `event_date`, `location`) VALUES ('Fan meeting', '2024-10-26', 'Seoul, South Korea');
INSERT INTO schedule (`event_type`, `event_date`, `location`) VALUES ('Concert', '2026-10-16', 'Seoul, South Korea');
INSERT INTO schedule (`event_type`, `event_date`, `location`) VALUES ('Variety Show', '2025-08-01', 'Seoul, South Korea');

SELECT * FROM schedule;
