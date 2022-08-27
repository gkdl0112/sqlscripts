-- 작성자 : 이성구
--1)
CREATE TABLE tbl_custom (
	custom_id varchar2 (20) PRIMARY KEY,
	name nvarchar2(20) NOT NULL ,
	email varchar2(20),
	age number(3),
	reg_date DATE DEFAULT sysdate
);

--상품 테이블 : 카테고리 예시 A1:전자제품, B2:식품

CREATE TABLE tbl_product(
	pcode varchar2(20) PRIMARY KEY,
	category char(2) NOT NULL,
	pname nvarchar2(20) NOT NULL,
	price number(9) NOT NULL
);

-- 구매 테이블 : 어느 고객이 무슨 상품을 구입하는가?
CREATE TABLE tbl_buy (
	custom_id varchar2(20) NOT NULL,
	pcode varchar2(20) NOT NULL,
	quantity number(5) NOT NULL,
	buy_date DATE DEFAULT sysdate
);
--DATE 형식에 지정되는 패턴 설정하기
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--2)
INSERT INTO TBL_CUSTOM (custom_id,name,email,age,reg_date) 
VALUES ('mina012','김미나','kimm@gmail.com',20,to_date('2022-03-10 14:23:25','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOM (custom_id,name,email,age,reg_date) 
VALUES ('hongGD','홍길동','gil@korea.com',32,to_date('2021-10-21 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_CUSTOM (custom_id,name,email,age,reg_date) 
VALUES ('twice','박모모','momo@daum.net',29,'2021-12-25 00:00:00');
INSERT INTO TBL_CUSTOM (custom_id,name,email,age,reg_date) 
VALUES ('wonder','이나나','lee@naver.com',40,sysdate);


INSERT INTO TBL_PRODUCT (pcode,category,pname,price) 
VALUES ('IPAD011','A1','아이패드10','880000');
INSERT INTO TBL_PRODUCT (pcode,category,pname,price) 
VALUES ('DOWON123a','B1','동원참치선물세트','54000');
INSERT INTO TBL_PRODUCT (pcode,category,pname,price) 
VALUES ('dk_143','A2','모션데스크','234500');

INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date) 
VALUES ('mina012','IPAD011',1,to_date('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date) 
VALUES ('hongGD','IPAD011',2,to_date('2022-06-29 20:37:47','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date) 
VALUES ('wonder','DOWON123a',3,to_date('2022-02-06 00:00:00','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date) 
VALUES ('mina012','dk_143',1,sysdate);
INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date) 
VALUES ('twice','DOWON123a',2,to_date('2022-02-09 08:49:55','YYYY-MM-DD HH24:MI:SS'));

--3)
ALTER TABLE TBL_BUY ADD buyNo number(8);

--4)
UPDATE TBL_BUY SET buyNo = 1001 WHERE CUSTOM_ID = 'mina012' AND PCODE = 'IPAD011';
UPDATE TBL_BUY SET buyNo = 1002 WHERE CUSTOM_ID = 'hongGD';
UPDATE TBL_BUY SET buyNo = 1003 WHERE CUSTOM_ID = 'wonder';
UPDATE TBL_BUY SET buyNo = 1004 WHERE PCODE  = 'dk_143';
UPDATE TBL_BUY SET buyNo = 1005 WHERE CUSTOM_ID = 'twice';

--5)
ALTER TABLE TBL_BUY ADD CONSTRAINT position_pk PRIMARY KEY(buyNo);
--6)
ALTER TABLE TBL_BUY ADD CONSTRAINT tbl_buy_fk1
	FOREIGN KEY(custom_id) REFERENCES tbl_custom;
ALTER TABLE TBL_BUY ADD TBL_BUY ADD CONSTRAINT tbl_buy_fk2
FOREIGN KEY(pcode) REFERENCES tbl_product;
--7)
CREATE SEQUENCE tblbuy_seq
	INCREMENT BY 1		--생략하면 기본 1
	START WITH 1006;
--8)
INSERT INTO TBL_BUY (custom_id,pcode,quantity,buy_date,BUYNO) 
VALUES ('wonder','IPAD011',1,to_date('2022-05-15 12:00:00','YYYY-MM-DD HH24:MI:SS')
,tblbuy_seq.nextval);

--9)
SELECT * FROM TBL_CUSTOM WHERE age>=30;
SELECT email FROM TBL_CUSTOM WHERE custom_id = 'twice';
SELECT pname FROM TBL_PRODUCT WHERE CATEGORY = 'A2';
SELECT max(price) FROM TBL_PRODUCT;
SELECT sum(quantity) FROM TBL_BUY WHERE PCODE = 'IPAD011';
SELECT pcode FROM TBL_BUY WHERE CUSTOM_ID = 'mina012';
SELECT * FROM TBL_BUY WHERE pcode LIKE '%0%';
SELECT * FROM TBL_BUY WHERE upper(pcode) LIKE upper('%on%');

