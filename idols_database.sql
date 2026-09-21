create database kpop_idol;

show database;

use kpop_idol;

CREATE TABLE idol (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `stage_name` VARCHAR(200),
  `real_name` VARCHAR(200),
  `Nationality` VARCHAR(100),
  `debut_year` YEAR,
  `group_id` INT NULL
);

CREATE TABLE group (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `group_name` VARCHAR(200),
  `agency` VARCHAR(200),
  `fandom_name` VARCHAR(45)
);

CREATE TABLE album (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(200),
  `release_date` DATE,
  `genre` VARCHAR(50),
  `group_id` INT NOT NULL
);

CREATE TABLE schedule (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `event_type` VARCHAR(200),
  `event_date` DATE NOT NULL,
  `location` VARCHAR(100),
  `group_id` INT NULL
);

INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`, `group_id`) VALUES ('Tzuyu', 'Chou-TzuYU', 'Taiwan', '2015', 1);
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`, `group_id`) VALUES ('Sana', 'Minatozaki-Sana', 'Japanese', '2015', 1);
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`, `group_id`) VALUES ('Nayeon', 'Im_Nayeon', 'Korean', '2015', 1);
INSERT INTO idol (`stage_name`, `real_name`, `Nationality`, `debut_year`, `group_id`) VALUES ('Mina', 'Myoui_Mina', 'Japanese', '2015', 1);

INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Twice', 'JYP_entertaiment', 'Once');
INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Blackpink', 'YG_entertaiment', 'Blink');
INSERT INTO group (`group_name`, `agency`, `fandom_name`) VALUES ('Babymonster', 'YG_entertaiment', 'MONSTIEZ');

INSERT INTO album (`title`, `release_date`, `genre`,  `group_id`) VALUES ('READY TO BE', '2023-03-10', 'K-pop', 1);
INSERT INTO album (`title`, `release_date`, `genre`,  `group_id`) VALUES ('TEN: The Story Goes On', '2025-10-10', 'K-pop', 1;
INSERT INTO album (`title`, `release_date`, `genre`,  `group_id`) VALUES ('BETWEEN 1&2', '2022-08-26', 'K-pop', 1);

INSERT INTO schedule (`event_type`, `event_date`, `location` , `group_id`) VALUES ('Fan meeting', '2024-10-26', 'Seoul, South Korea', 1);
INSERT INTO schedule (`event_type`, `event_date`, `location`,  `group_id`) VALUES ('Concert', '2026-10-16', 'Seoul, South Korea', 1);
INSERT INTO schedule (`event_type`, `event_date`, `location`,  `group_id`) VALUES ('Variety Show', '2025-08-01', 'Seoul, South Korea', 1);


-- foreign key code , idol, album, schedule
ALTER TABLE `kpop_idol`.`idol` 
DROP FOREIGN KEY `group_id`;
ALTER TABLE `kpop_idol`.`idol` 
ADD CONSTRAINT `group_id`
  FOREIGN KEY (`group_id`)
  REFERENCES `kpop_idol`.`group` (`id`)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE `album`
ADD CONSTRAINT `fk_album_group`
FOREIGN KEY (`group_id`)
REFERENCES `group` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE `schedule`
ADD CONSTRAINT `fk_schedule_group`
FOREIGN KEY (`group_id`)
REFERENCES `group` (`id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- left join
SELECT album.* FROM album LEFT JOIN `group` ON  album.group_id = `group`.id;

SELECT idol.* FROM idol LEFT JOIN `group` ON  idol.group_id = `group`.id;

SELECT schedule.* FROM schedule LEFT JOIN `group` ON  schedule.group_id = `group`.id;