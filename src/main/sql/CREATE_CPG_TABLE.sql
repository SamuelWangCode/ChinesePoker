DROP TABLE USER_RELATED_GAME;
DROP TABLE GAME_INFO;
DROP TABLE USER_INFO;

CREATE TABLE USER_INFO (
  USER_ID INTEGER GENERATED ALWAYS AS IDENTITY,
  USER_NAME VARCHAR2(32) NOT NULL UNIQUE,
  USER_PWD VARCHAR2(16) NOT NULL,
  USER_SCORE INTEGER NOT NULL ,
  USER_WINNUM INTEGER NOT NULL ,
  USER_LOSENUM INTEGER NOT NULL ,
  PRIMARY KEY(USER_ID)
);

CREATE TABLE GAME_INFO (
	GAME_ID INTEGER GENERATED ALWAYS AS IDENTITY,
	GAME_TIME VARCHAR2(30) NOT NULL,
	PRIMARY KEY(GAME_ID)
);

CREATE TABLE USER_RELATED_GAME (
	USER_ID INTEGER NOT NULL,
	GAME_ID INTEGER NOT NULL,
	USER_SIGN INTEGER NOT NULL,
	USER_SCORE INTEGER NOT NULL,
	PRIMARY KEY(USER_ID, GAME_ID),
	FOREIGN KEY (USER_ID) REFERENCES USER_INFO(USER_ID) ON DELETE CASCADE,
	FOREIGN KEY (GAME_ID) REFERENCES GAME_INFO(GAME_ID) ON DELETE CASCADE
);