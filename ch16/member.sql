CREATE TABLE IF NOT EXISTS member (
	id varchar(20) not null primary key,
	pw varchar(20),
	name varchar(30)
);

SELECT * FROM member;

DELETE FROM member;