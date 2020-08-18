/* product */
SHOW TABLES;

DESC product;
SELECT * FROM product;
DROP TABLE product;

CREATE TABLE IF NOT EXISTS product (	
	p_id varchar(10) not null primary key,	/* IF NOT EXISTS 옵션은 product 테이블이 없다면 테이블을 생성하라는 의미 */
	p_name varchar(10),
	p_unitPrice double,
	p_description text,
	p_category varchar(20),
	p_manufacturer varchar(20),
	p_unitsInStock long,
	p_condition varchar(20),
	p_fileName varchar(20)
--	primary key (p_id)
)default charset=utf8;	/* product 테이블의 캐릭터 세트를 utf8로 작성 */

INSERT INTO product VALUES('P1234','iPhone 6s',800000,'1334X750 Renina HD display, 8-megapixel iSight Camera','Smart Phone','Apple',1000,'new','P1234.png');	
INSERT INTO product VALUES('P1235','LG PC gram',1500000,'3.3-inch,IPS LED display, 5rd Generation Intel Core preocessors','Notebook','LG',1000,'new','P1235.png');	
INSERT INTO product VALUES('P1236','Galaxy Tab S',900000,'3.3-inch, 212.8*123.6*6.6mm, Super AMOLED display, Octa-Core processor','Tablet','Samsung',1000,'new','P1236.png');	

ALTER TABLE product CHANGE COLUMN p_name p_name varchar(20);


/* jspbook_member */
CREATE TABLE IF NOT EXISTS jspbook_member (
	id varchar(20) not null primary key,
	pw varchar(20),
	name varchar(30),
	gender varchar(4),
	birth varchar(10),
	mail varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50) default now()
)default charset=utf8;

SELECT * FROM jspbook_member;

DELETE FROM member;

/* board */
CREATE TABLE board (
	num int not null primary key auto_increment,
	id varchar(20) not null,
	name varchar(20) not null,
	subject varchar(100) not null,
	content text not null,
	regist_day varchar(30),
	hit int,
	ip varchar(20)	
)default charset=utf8;

drop table board;

insert into board(id,name,subject,content,regist_day,hit,ip) values(1,1,1,1,1,1,1);
insert into board(id,name,subject,content,regist_day,hit,ip) values(2,2,2,2,2,2,2);
insert into board(id,name,subject,content,regist_day,hit,ip) values(3,3,3,3,3,3,3);
insert into board(id,name,subject,content,regist_day,hit,ip) values(4,4,4,4,4,4,4);
insert into board(id,name,subject,content,regist_day,hit,ip) values(5,5,5,5,5,5,5);
insert into board(id,name,subject,content,regist_day,hit,ip) values(6,6,6,6,6,6,6);
insert into board(id,name,subject,content,regist_day,hit,ip) values(7,7,7,7,7,7,7);
insert into board(id,name,subject,content,regist_day,hit,ip) select id,name,subject,content,regist_day,hit,ip from board;

delete from board;

select * from board;