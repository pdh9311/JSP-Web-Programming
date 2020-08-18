CREATE TABLE IF NOT EXISTS member (
	id varchar(20) not null primary key,
	pw varchar(20),
	name varchar(30)
);

INSERT INTO member VALUES('1','1234','홍길순');
INSERT INTO member VALUES('2','1235','홍길동');

SELECT * FROM member;

DELETE FROM member;