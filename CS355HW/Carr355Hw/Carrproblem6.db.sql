BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `Worked_On` (
	`SID`	integer,
	`PID`	integer,
	FOREIGN KEY(`PID`) REFERENCES `Project`(`PID`),
	FOREIGN KEY(`SID`) REFERENCES `Student`(`SID`)
);
INSERT INTO `Worked_On` VALUES (43,1467);
INSERT INTO `Worked_On` VALUES (1204,1455);
INSERT INTO `Worked_On` VALUES (1206,1232);
INSERT INTO `Worked_On` VALUES (1434,1467);
INSERT INTO `Worked_On` VALUES (1467,1232);
CREATE TABLE IF NOT EXISTS `Work_In` (
	`DNUM`	integer,
	`FID`	integer,
	`TIME`	real,
	PRIMARY KEY(`DNUM`,`FID`),
	FOREIGN KEY(`DNUM`) REFERENCES `Department`(`DNUM`) on delete cascade
);
INSERT INTO `Work_In` VALUES (35,1256565,0.45);
INSERT INTO `Work_In` VALUES (35,1467,0.55);
INSERT INTO `Work_In` VALUES (104,9999999,0.05);
INSERT INTO `Work_In` VALUES (35,12233345,0.15);
INSERT INTO `Work_In` VALUES (35,12233346,0.1);
CREATE TABLE IF NOT EXISTS `Student` (
	`SID`	integer,
	`Age`	integer,
	`Name`	text,
	`Major`	text,
	`PID`	integer,
	FOREIGN KEY(`PID`) REFERENCES `Project`(`PID`) on delete cascade,
	PRIMARY KEY(`SID`)
);
INSERT INTO `Student` VALUES (43,20,'Bro','psyche',1467);
INSERT INTO `Student` VALUES (1204,25,'Boogy','english',1455);
INSERT INTO `Student` VALUES (1206,25,'X-man','math',1232);
INSERT INTO `Student` VALUES (1434,26,'X-woman','math',1467);
INSERT INTO `Student` VALUES (1467,12,'Dude','CS',1232);
CREATE TABLE IF NOT EXISTS `Project` (
	`PID`	INTEGER,
	`SponName`	TEXT,
	`StarDate`	TEXT,
	`EndDate`	TEXT,
	`BUDGET`	INTEGER,
	PRIMARY KEY(`PID`)
);
INSERT INTO `Project` VALUES (1232,'Joe','9/17/1983','9/17/1982',10000);
INSERT INTO `Project` VALUES (1455,'Ray','9/17/1945','9/17/1982',45);
INSERT INTO `Project` VALUES (1467,'Dork','9/17/1952','9/17/1990',10344555);
INSERT INTO `Project` VALUES (23445,'Master Chief','9/17/1944','9/17/1989',10200000);
INSERT INTO `Project` VALUES (7585858,'Master Cheif','9/17/1974','9/17/1999',1);
CREATE TABLE IF NOT EXISTS `Faculty` (
	`FID`	INTEGER,
	`AGE`	INTEGER,
	`Rank`	TEXT,
	`Salary`	REAL,
	`DNUM`	INTEGER,
	`PID`	integer,
	FOREIGN KEY(`PID`) REFERENCES `Project`(`PID`) on delete cascade,
	PRIMARY KEY(`FID`),
	FOREIGN KEY(`DNUM`) REFERENCES `Department`(`DNUM`) on delete cascade
);
INSERT INTO `Faculty` VALUES (1256565,34,'Dr.',1000000.0,127,1467);
INSERT INTO `Faculty` VALUES (1789900,55,'Dr.',2.0,12,1467);
INSERT INTO `Faculty` VALUES (9999999,0,'Dr.',0.0,104,23445);
INSERT INTO `Faculty` VALUES (12233345,104,'Dr.',1200.0,35,1232);
INSERT INTO `Faculty` VALUES (12233346,12,'Dr.',1607070.0,35,1455);
CREATE TABLE IF NOT EXISTS `Department` (
	`DNUM`	INTEGER,
	`DeptName`	TEXT,
	`Office`	TEXT,
	PRIMARY KEY(`DNUM`)
);
INSERT INTO `Department` VALUES (12,'math','room 43');
INSERT INTO `Department` VALUES (23,'pe','room 102');
INSERT INTO `Department` VALUES (34,'english','room 44');
INSERT INTO `Department` VALUES (35,'bio','room 20');
INSERT INTO `Department` VALUES (36,'history','room 34');
INSERT INTO `Department` VALUES (104,'spanish','room 05');
INSERT INTO `Department` VALUES (127,'chem','room 4');
CREATE TABLE IF NOT EXISTS `Chair` (
	`DNUM`	integer,
	`FID`	integer,
	FOREIGN KEY(`DNUM`) REFERENCES `Department`(`DNUM`) on delete cascade,
	FOREIGN KEY(`FID`) REFERENCES `Faculty`(`FID`) on delete cascade
);
INSERT INTO `Chair` VALUES (35,1256565);
INSERT INTO `Chair` VALUES (NULL,NULL);
INSERT INTO `Chair` VALUES (NULL,NULL);
INSERT INTO `Chair` VALUES (NULL,NULL);
INSERT INTO `Chair` VALUES (NULL,NULL);
COMMIT;
